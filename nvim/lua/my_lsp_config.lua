local lspconfigs = {
  --{{{ sumneko_lua
  ['sumneko_lua'] = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim', 'packer_plugins'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
  --}}}
  --{{{ yamlls
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
          -- ["../path/relative/to/file.yml"] = "/.github/workflows/*"
          -- ["/path/from/root/of/project"] = "/.github/workflows/*"
        },
        schemaStore = {
          enable = true
        },
      },
    }
  },
  --}}}
--{{{ jsonls
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      }
    }
  },
  --}}}

  'jsonls', 'gopls', 'pyright', 'bashls', 'ansiblels',
}

local on_attach_func = function(client, bufnr)
  require'my_keymaps'.local_keymaps(client, bufnr)
  require'my_keymaps.space.d'.local_keymaps(client, bufnr)
end

local default_conf = {
  on_attach = on_attach_func,
}

local function add_on_attach(conf)
  if conf['on_attach'] == nil then
    conf['on_attach'] = on_attach_func
  end
  return conf
end

return {
  setup = function(ensure_capabilities)
    local lsp = require 'lspconfig'

    for lang, lspconf in pairs(lspconfigs) do
      if type(lspconf) == 'string' then
        lsp[lspconf].setup(ensure_capabilities(default_conf))
      else
        lsp[lang].setup(ensure_capabilities(add_on_attach(lspconf)))
      end
    end
  end
}

-- vim:set foldmethod=marker:
