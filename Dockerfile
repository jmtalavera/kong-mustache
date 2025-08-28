# docker build -t kong-gateway-db-sql .
FROM kong/kong-gateway:latest
USER root

#RUN mkdir -p /usr/local/share/lua/5.1/kong/plugins/db-sql
#COPY /kong/plugins/db-sql/* /usr/local/share/lua/5.1/kong/plugins/db-sql/

#RUN apk update && apk add git musl-dev libffi-dev gcc g++ file make
#RUN apk add mariadb-dev
#RUN luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql
RUN luarocks install lustache
COPY ./kong/plugins/kong-mustache-plugin /usr/local/share/lua/5.1/kong/plugins/kong-mustache-plugin

# reset back the defaults
USER kong
ENV KONG_PLUGINS=bundled,kong-mustache-plugin