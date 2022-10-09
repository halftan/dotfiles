local sub_keymaps = {'space', 'leader', 'g'}

for _, v in pairs(sub_keymaps) do
  local ok, keydef = pcall(require, 'my_keymaps.' .. v)
  if ok and type(keydef) == 'table' and keydef.setup ~= nil then
    keydef.setup()
  end
end

local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['<c-p>'] = {'<cmd>Telescope find_files hidden=true<cr>', 'Find files'},
  ['H'] = {'<cmd>BufferPrevious<cr>', 'Previous buffer'},
  ['L'] = {'<cmd>BufferNext<cr>', 'Next buffer'},
  ['<S-Left>'] = {'<cmd>BufferMovePrevious<cr>', 'Move buffer left'},
  ['<S-Right>'] = {'<cmd>BufferMoveNext<cr>', 'Move buffer right'},
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
  ['[d'] = {vim.diagnostic.goto_prev, 'Previous error'},
  [']d'] = {vim.diagnostic.goto_next, 'Next error'},
  ['[c'] = {require'gitsigns'.prev_hunk, 'Previous error'},
  [']c'] = {require'gitsigns'.next_hunk, 'Next error'},

  [','] = {
    name = 'LSP',
  },
})

local M = {}

function M.local_keymaps(client, bufnr)
  wk.register({
    [','] = {
      name = 'LSP',
      ['g'] = {
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
      ['w'] = {
        name = 'Workspace',
        ['S'] = {function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, 'Stop LSP client'},
      }
    },
  })

  wk.register({
    ['gd'] = {vim.lsp.buf.definition, 'Goto definition'},
    ['gD'] = {vim.lsp.buf.declaration, 'Goto declaration'},
    ['K'] = {vim.lsp.buf.hover, 'Hover action'},
  }, {
      buffer = bufnr,
    })
end

return M
