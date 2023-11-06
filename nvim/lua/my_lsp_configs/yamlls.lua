return {
  filetypes = {
    "yaml"
  },
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require('schemastore').json.schemas(),
    },
  },
}
