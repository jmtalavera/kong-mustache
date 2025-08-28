local typedefs = require "kong.db.schema.typedefs"

local PLUGIN_NAME = "kong-mustache-plugin"

local schema = {
  name = PLUGIN_NAME,

  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { mustacheTemplate = { type = "string", required = true } },
          { contentType = {type = "string", required = false} }
        },
      },
    },
  },
}

return schema
