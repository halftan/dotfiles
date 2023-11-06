local M = {}

local function load_lsp_configs()
  local module_path = debug.getinfo(2, 'S').source:match('^@(.+)/')
  local lsp_config_files = require'plenary.scandir'.scan_dir(module_path, { hidden = false, depth = 1})
  local configs = {}
  for _, filename in ipairs(lsp_config_files) do
    local lsp_name = filename:match('/([^/]+).lua$')
    if lsp_name ~= nil and lsp_name ~= 'init' then
      configs[lsp_name] = require('my_lsp_configs.' .. lsp_name)
    end
  end
  return configs
end

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
    -- else
    --   vim.bo[bufnr].formatexpr = nil
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
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('null_ls_config').setup()
        end
      },
    },
    config = function()
      local lsp_configs = load_lsp_configs()
      for lang, lspconf in pairs(lsp_configs) do
        lsp_configs[lang] = ensure_capabilities(add_on_attach(lspconf))
      end
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      table.insert(lsp_configs, function (server_name)
        require("lspconfig")[server_name].setup(
          ensure_capabilities(add_on_attach({}))
        )
      end)
      require("mason-lspconfig").setup_handlers(lsp_configs)
    end
  })
end

M.on_attach_func = on_attach_func

return M
