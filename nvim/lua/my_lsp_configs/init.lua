local M = {}

local signature_setup = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local function is_null_ls_formatting_enabed(bufnr)
  local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
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
      vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    else
      vim.api.nvim_buf_set_option(bufnr, 'formatexpr', nil)
    end
  end
end

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

M.setup = function(pluginSpecs, ensure_capabilities)
  table.insert(pluginSpecs, {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim', lazy = false, config = true },
        lazy = false,
        config = true,
      },
      'SmiteshP/nvim-navic',
      'ray-x/lsp_signature.nvim',
      {
        'nvimtools/none-ls.nvim',
        config = function()
          require('null_ls_config').setup()
        end
      },
    },
    config = function()
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name)
          local ok, lsp_conf = pcall(require, 'my_lsp_configs.' .. server_name)
          if not ok then
            lsp_conf = {}
          end
          require("lspconfig")[server_name].setup(
            ensure_capabilities(add_on_attach(lsp_conf))
          )
        end
      }
    end
  })
end

M.on_attach_func = on_attach_func

return M
