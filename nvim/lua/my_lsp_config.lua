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
          globals = {'vim', 'packer_plugins'},
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
-- {{{ ansiblels
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
-- }}}

  'gopls', 'pyright', 'bashls', 'vimls',
}

local signature_setup = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}

local on_attach_func = function(client, bufnr)
  require'my_keymaps'.local_keymaps(client, bufnr)
  require'my_keymaps.space.d'.local_keymaps(client, bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  else
    vim.notify("LSP server does not support document symbol")
  end

  require "lsp_signature".on_attach(signature_setup, bufnr)
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
  vim.keymap.set("n", "p", function() pin_preview_window(floating_winnr) end, {buffer = floating_bufnr, silent = true, noremap = true, nowait = true})
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
