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

  'gopls', 'pyright', 'bashls', 'ansiblels', 'vimls',
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
        lsp[lspconf].setup(ensure_capabilities(default_conf))
      else
        lsp[lang].setup(ensure_capabilities(add_on_attach(lspconf)))
      end
    end
  end
}

-- vim:set foldmethod=marker:
