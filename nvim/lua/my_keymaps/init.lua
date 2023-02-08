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
  ['H'] = {'<cmd>BufferLineCyclePrev<cr>', 'Previous buffer'},
  ['L'] = {'<cmd>BufferLineCycleNext<cr>', 'Next buffer'},
  ['<S-Left>'] = {'<cmd>BufferLineMovePrev<cr>', 'Move buffer left'},
  ['<S-Right>'] = {'<cmd>BufferLineMoveNext<cr>', 'Move buffer right'},
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

  ['<c-a>'] = {require('dial.map').inc_normal(), 'Increment'},
  ['<c-x>'] = {require('dial.map').dec_normal(), 'Decrement'},
})

wk.register({
  ['<c-a>'] = {require('dial.map').inc_visual(), 'Increment'},
  ['<c-x>'] = {require('dial.map').dec_visual(), 'Decrement'},
  ['g<c-a>'] = {require('dial.map').inc_gvisual(), 'Increment'},
  ['g<c-x>'] = {require('dial.map').dec_gvisual(), 'Decrement'},
}, { mode = 'v' })

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
    ['-'] = {'za', 'Toggle fold'}
  })

  wk.register({
    ['gd'] = {vim.lsp.buf.definition, 'Goto definition'},
    ['gD'] = {vim.lsp.buf.declaration, 'Goto declaration'},
    ['K'] = {require("hover").hover, 'Hover action'},
    ['gK'] = {require("hover").hover_select, 'Hover action selecte provider'},
  }, {
      buffer = bufnr,
    })
end

return M
