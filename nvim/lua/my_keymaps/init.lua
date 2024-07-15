local sub_keymaps = {'space', 'leader', 'g'}

for _, v in pairs(sub_keymaps) do
  local ok, keydef = pcall(require, 'my_keymaps.' .. v)
  if ok and type(keydef) == 'table' and keydef.setup ~= nil then
    keydef.setup()
  end
end

local wk = require('which-key')
local utils = require('my_utils')

wk.add({
  {
    mode = "n",
    {'<c-n>', '<Plug>(YankyCycleForward)', desc = 'Yanky Cycle Forward'},
    {'<c-p>', '<Plug>(YankyCycleBackward)', desc = 'Yanky Cycle Backward'},
    {'p', '<Plug>(YankyPutAfter)', desc = 'Yanky Put After'},
    {'P', '<Plug>(YankyPutBefore)', desc = 'Yanky Put Before'},
    {'gp', '<Plug>(YankyGPutAfter)', desc = 'Yanky GPut After'},
    {'gP', '<Plug>(YankyGPutBefore)', desc = 'Yanky GPut Before'},
    {'y', '<Plug>(YankyYank)', desc = 'Yanky Yank'},
    {'H', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous buffer'},
    {'L', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer'},
    {'<S-Left>', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer left'},
    {'<S-Right>', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer right'},
    {'[d', vim.diagnostic.goto_prev, desc = 'Previous error'},
    {']d', vim.diagnostic.goto_next, desc = 'Next error'},
    {'[c', require'gitsigns'.prev_hunk, desc = 'Previous error'},
    {']c', require'gitsigns'.next_hunk, desc = 'Next error'},
    {'-', 'za', desc = 'Toggle fold'},
  },
  -- ['H'] = {function()
  --   if vim.fn.tabpagenr('$') > 1 then
  --     vim.cmd('normal gT')
  --   else
  --     vim.cmd('bprevious')
  --   end
  -- end, 'Previous tab'},
  -- ['L'] = {function()
  --   if vim.fn.tabpagenr('$') > 1 then
  --     vim.cmd('normal gt')
  --   else
  --     vim.cmd('bnext')
  --   end
  -- end, 'Next tab'},

  {',', group = 'LSP/Main'},

  {
    mode = 'x',
    {'p', '<Plug>(YankyPutAfter)', desc = 'Yanky Put After'},
    {'P', '<Plug>(YankyPutBefore)', desc = 'Yanky Put Before'},
    {'gp', '<Plug>(YankyGPutAfter)', desc = 'Yanky GPut After'},
    {'gP', '<Plug>(YankyGPutBefore)', desc = 'Yanky GPut Before'},
    {'y', '<Plug>(YankyYank)', desc = 'Yanky Yank'},
  },
})


local M = {}

function M.local_keymaps(client, bufnr)
  wk.add({
    {',g', group = 'Goto'},
    {',r', group = 'Refactoring'},
    {',c', group = 'Code'},
    {',W', group = 'Workspace'},
    {
      mode = 'n',
      {',gd', require'telescope.builtin'.lsp_definitions, desc = 'Goto definition'},
      {',gD', vim.lsp.buf.declaration, desc = 'Goto declaration'},
      {',gr', require'telescope.builtin'.lsp_references, desc = 'Find references'},
      {',gi', require'telescope.builtin'.lsp_implementations, desc = 'Find implementations'},
      {',rn', vim.lsp.buf.rename, desc = 'Rename'},
      {',=', function() vim.lsp.buf.format { async = false } end, desc = 'Format buffer'},
      {',ca', vim.lsp.buf.code_action, desc = 'Code action'},
      {',cd', vim.lsp.buf.type_definition, desc = 'Type definition'},
      {',WS', function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, desc = 'Stop LSP client'},
      {',Wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = 'Print workspace folders'},
      {',Wa', vim.lsp.buf.add_workspace_folder, desc = 'Add workspace folder'},
      {',Wr', vim.lsp.buf.remove_workspace_folder, desc = 'Remove workspace folder'},
    },
    {
      mode = 'v',
      {',ca', vim.lsp.buf.code_action, desc = 'Code action'},
    },
    {
      mode = 'n',
      buffer = bufnr,
      {'gd', vim.lsp.buf.definition, desc = 'Goto definition'},
      {'gD', vim.lsp.buf.declaration, desc = 'Goto declaration'},
      {'gi', vim.lsp.buf.implementation, desc = 'Find implementation'},
      {'<C-k>', vim.lsp.buf.signature_help, desc = 'Signature help'},
      {'K', require("hover").hover, desc = 'Hover action'},
      {'gK', require("hover").hover_select, desc = 'Hover action selecte provider'},
    },
  })

  require 'my_keymaps.space'.local_keymaps(client, bufnr)

  local ft = vim.api.nvim_get_option_value('filetype', {buf = bufnr})
  local ok, ftkeymap = pcall(require, 'my_keymaps.filetype.' .. ft)
  if ok then
    ftkeymap.setup(client, bufnr)
  end
end

return M
