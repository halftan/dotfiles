return {
  setup = function()
    require('coq_3p') {
      { src = 'nvimlua', short_name = 'nLUA', conf_only = false },
      { src = 'builtin/syntax', short_name = 'SYN' },
      { src = 'vim_dadbod_completion', short_name = 'DB' },
    }

    local lsp = require 'lspconfig'
    local coq = require 'coq'

    local lspconfigs = {
      --{{{ sumneko_lua
      ['sumneko_lua'] = require('lua-dev').setup({
        library = {
          vimruntime = true,
          types = true,
          plugins = true,
        },
        lspconfig = {
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
      }),
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

    for lang, lspconf in pairs(lspconfigs) do
      if type(lspconf) == 'string' then
        lsp[lspconf].setup(coq.lsp_ensure_capabilities({}))
      else
        lsp[lang].setup(coq.lsp_ensure_capabilities(lspconf))
      end
    end
  end
}

-- vim:set foldmethod=marker:
