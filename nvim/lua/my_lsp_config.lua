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

local on_attach_func = function(client, bufnr)
  local wk = require('which-key')
  wk.register({
    ['d'] = {
      name = 'Diagnostics',
    },
    ['l'] = {
      name = 'LSP',
      ['g'] {
        name = 'Goto',
        ['d'] = {require'telescope.builtin'.lsp_definitions, 'Goto definition'},
        ['D'] = {vim.lsp.buf.declaration, 'Goto declaration'},
        ['r'] = {require'telescope.builtin'.lsp_references, 'Find references'},
      },
      ['r'] = {
        name = 'Refactoring',
        ['n'] = {vim.lsp.buf.rename, 'Rename'},
      },
      ['a'] = {vim.lsp.buf.code_action, 'Code action'},
      ['='] = {vim.lsp.buf.formatting, 'Format'},
      ['S'] = {function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, 'Stop LSP client'},
    },
  }, {
      prefix = '<space>',
      buffer = bufnr,
    })

  wk.register({
    ['gd'] = {vim.lsp.buf.definition, 'Goto definition'},
    ['gD'] = {vim.lsp.buf.declaration, 'Goto declaration'},
    ['K'] = {vim.lsp.buf.hover, 'Hover action'},
  }, {
      buffer = bufnr,
    })
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

    -- TODO: customize on_attach function to register buffer keymaps with wk
    -- see :h lspconfig-keybindings
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
