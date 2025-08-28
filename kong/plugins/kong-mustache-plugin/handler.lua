local plugin = {
    PRIORITY = 1000,
    VERSION = "0.0.1",
}

 local lustache = require "lustache"

function plugin:access(conf)
    local transformed_body = lustache:render(conf.mustacheTemplate, kong.request.get_body())

    if conf.contentType ~= nil then
        kong.service.request.set_header("Content-Type", conf.contentType)
    else
        kong.service.request.set_header("Content-Type", "application/json")
    end

    kong.service.request.set_raw_body(transformed_body)
end

return plugin



