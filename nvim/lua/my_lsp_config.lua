return {
  setup = function(ensure_capabilities)
    local lsp = require 'lspconfig'

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
          },
        }
      },
      --}}}

      'gopls', 'pyright', 'bashls', 'ansiblels',
    }

    -- TODO: customize on_attach function to register buffer keymaps with wk
    -- see :h lspconfig-keybindings
    for lang, lspconf in pairs(lspconfigs) do
      if type(lspconf) == 'string' then
        lsp[lspconf].setup(ensure_capabilities({}))
      else
        lsp[lang].setup(ensure_capabilities(lspconf))
      end
    end
  end
}

-- vim:set foldmethod=marker:
