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
          globals = { 'vim', 'packer_plugins' },
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

local signature_setup = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}

local function is_null_ls_formatting_enabed(bufnr)
  local file_type = vim.bo[bufnr].filetype
  local generators = require("null-ls.generators").get_available(
    file_type,
    require("null-ls.methods").internal.FORMATTING
  )
  return #generators > 0
end

local on_attach_func = function(client, bufnr)
  require 'my_keymaps'.local_keymaps(client, bufnr)
  require 'my_keymaps.space.d'.local_keymaps(client, bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  else
    vim.notify("LSP server does not support document symbol")
  end

  require "lsp_signature".on_attach(signature_setup, bufnr)

  if client.server_capabilities.documentFormattingProvider then
    if client.name == "null-ls" and is_null_ls_formatting_enabed(bufnr)
        or client.name ~= "null-ls"
    then
      vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
    else
      vim.bo[bufnr].formatexpr = nil
    end
  end
end

local default_conf = {
  on_attach = on_attach_func,
}

local function add_on_attach(conf)
  if conf['on_attach'] == nil then
    conf['on_attach'] = on_attach_func
  else
    local original_on_attach_func = conf['on_attach']
    conf['on_attach'] = function(client, bufnr)
      on_attach_func(client, bufnr)
      original_on_attach_func(client, bufnr)
    end
  end
  return conf
end

local function pin_preview_window(winnr)
  local ok, result = pcall(vim.api.nvim_win_get_var, vim.api.nvim_get_current_win(), 'preview_window_pinned')
  local pinned = 0
  if ok then pinned = tonumber(result) end
  vim.api.nvim_win_set_var(winnr, 'preview_window_pinned', 1 - pinned)
end

local function my_hover_handler(err, result, ctx, config)
  local floating_bufnr, floating_winnr = vim.lsp.handlers.hover(err, result, ctx, config)
  vim.keymap.set("n", "p", function() pin_preview_window(floating_winnr) end,
    { buffer = floating_bufnr, silent = true, noremap = true, nowait = true })
end

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   my_hover_handler, {
--     border = "single",
--   }
-- )

-- vim.lsp.util._close_preview_window = function(winnr, bufnrs)
--   vim.schedule(function()
--     -- exit if we are in one of ignored buffers
--     if bufnrs and vim.tbl_contains(bufnrs, vim.api.nvim_get_current_buf()) then
--       return
--     end
--
--     local ok, result = pcall(vim.api.nvim_win_get_var, vim.api.nvim_get_current_win(), 'preview_window_pinned')
--     local pinned = 0
--     if ok then pinned = tonumber(result) end
--     if pinned == 1 then
--       return
--     end
--
--     local augroup = 'preview_window_'..winnr
--     vim.cmd(string.format([[
--       augroup %s
--         autocmd!
--       augroup end
--       augroup! %s
--     ]], augroup, augroup))
--     pcall(vim.api.nvim_win_close, winnr, true)
--   end)
-- end

return {
  setup = function(ensure_capabilities)
    local lsp = require 'lspconfig'

    for lang, lspconf in pairs(lspconfigs) do
      if type(lspconf) == 'string' then
        lsp[lspconf].setup(ensure_capabilities(add_on_attach(default_conf)))
      else
        lsp[lang].setup(ensure_capabilities(add_on_attach(lspconf)))
      end
    end
  end,
  on_attach_func = on_attach_func,
}

-- vim:set foldmethod=marker:
