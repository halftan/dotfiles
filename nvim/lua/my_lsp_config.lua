local lspconfigs = {
  --{{{ lua_ls
  ['lua_ls'] = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          maxPreload = 100000,
          preloadFileSize = 10000,
          checkThirdParty = false,
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
    filetypes = {
      "yaml",
    },
    settings = {
      yaml = {
        completion = true,
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          -- ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*.ya?ml",
          -- ["../path/relative/to/file.yml"] = "/.github/workflows/*"
          -- ["/path/from/root/of/project"] = "/.github/workflows/*"
        },
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        customTags = {
          "!Base64 scalar",
          "!Cidr scalar",
          "!And sequence",
          "!Equals sequence",
          "!If sequence",
          "!Not sequence",
          "!Or sequence",
          "!Condition scalar",
          "!FindInMap sequence",
          "!GetAtt scalar",
          "!GetAtt sequence",
          "!GetAZs scalar",
          "!ImportValue scalar",
          "!Join sequence",
          "!Select sequence",
          "!Split sequence",
          "!Sub scalar",
          "!Transform mapping",
          "!Ref scalar",
          "!ImportValue scalar",
          "!ImportValue mapping",
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

  'pyright',
  'bashls',
  'vimls',
}

local add_if_command_exist = function(command, lspconfig)
  if vim.fn.executable(command) == 1 then
    if type(lspconfig) == "string" then
      lspconfigs[#lspconfigs+1] = lspconfig
    elseif type(lspconfig) == "table" then
      for k, v in pairs(lspconfig) do
        lspconfigs[k] = v
      end
    else
      vim.notify(string.format("LSP config for command %s is not recognized.", command))
    end
  end
end

add_if_command_exist("terraform", "terraformls")
add_if_command_exist("go", "gopls")
add_if_command_exist("ansible", { -- {{{ ansiblels
  ansiblels = {
    settings = {
      ansible = {
        validation = {
          enabled = false,
          lint = {
            enabled = false,
          },
        },
      }
    },
    on_attach = function(client, bufnr)
      vim.diagnostic.disable(nil, vim.lsp.diagnostic.get_namespace(client.id))
    end
  },
}) -- }}}


return {
  setup = function(pluginSpecs, ensure_capabilities)
    table.insert(pluginSpecs, {
      'neovim/nvim-lspconfig',
      dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'SmiteshP/nvim-navic',
        'ray-x/lsp_signature.nvim',
        {
          'jose-elias-alvarez/null-ls.nvim',
          config = function()
            require('null_ls_config').setup()
          end
        },
      },
      config = function()
        local lsp = require 'lspconfig'

        for lang, lspconf in pairs(lspconfigs) do
          if type(lspconf) == 'string' then
            lsp[lspconf].setup(ensure_capabilities(add_on_attach(default_conf)))
          else
            lsp[lang].setup(ensure_capabilities(add_on_attach(lspconf)))
          end
        end
      end
    })
  end,
  on_attach_func = on_attach_func,
}

-- vim:set foldmethod=marker:
