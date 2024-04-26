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
  ['<c-n>'] = {'<Plug>(YankyCycleForward)', 'Yanky Cycle Forward'},
  ['<c-p>'] = {'<Plug>(YankyCycleBackward)', 'Yanky Cycle Backward'},
  ['p'] = {'<Plug>(YankyPutAfter)', 'Yanky Put After'},
  ['P'] = {'<Plug>(YankyPutBefore)', 'Yanky Put Before'},
  ['gp'] = {'<Plug>(YankyGPutAfter)', 'Yanky GPut After'},
  ['gP'] = {'<Plug>(YankyGPutBefore)', 'Yanky GPut Before'},
  ['y'] = {'<Plug>(YankyYank)', 'Yanky Yank'},
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

  ['-'] = {'za', 'Toggle fold'},
})

wk.register({
  ['p'] = {'<Plug>(YankyPutAfter)', 'Yanky Put After'},
  ['P'] = {'<Plug>(YankyPutBefore)', 'Yanky Put Before'},
  ['gp'] = {'<Plug>(YankyGPutAfter)', 'Yanky GPut After'},
  ['gP'] = {'<Plug>(YankyGPutBefore)', 'Yanky GPut Before'},
  ['y'] = {'<Plug>(YankyYank)', 'Yanky Yank'},
}, { mode = 'x' })

wk.register({
  ['<Enter>'] = {'<Plug>(EasyAlign)', 'Live EasyAlign'},
}, { mode = 'v' })

local M = {}

function M.local_keymaps(client, bufnr)
  wk.register({
    [','] = {
      name = 'LSP/Main',
      ['g'] = {
        name = 'Goto',
        ['d'] = {require'telescope.builtin'.lsp_definitions, 'Goto definition'},
        ['D'] = {vim.lsp.buf.declaration, 'Goto declaration'},
        ['r'] = {require'telescope.builtin'.lsp_references, 'Find references'},
        ['i'] = {require'telescope.builtin'.lsp_implementations, 'Find implementations'},
      },
      ['r'] = {
        name = 'Refactoring',
        ['n'] = {vim.lsp.buf.rename, 'Rename'},
      },
      ['='] = {function() vim.lsp.buf.format { async = false } end, 'Format buffer'},
      ['c'] = {
        name = 'Code',
        ['a'] = {vim.lsp.buf.code_action, 'Code action'},
        ['d'] = {vim.lsp.buf.type_definition, 'Type definition'},
      },
      ['w'] = {
        name = 'Workspace',
        ['S'] = {function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, 'Stop LSP client'},
        ['l'] = {function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Print workspace folders'},
        ['a'] = {vim.lsp.buf.add_workspace_folder, 'Add workspace folder'},
        ['r'] = {vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder'},
      }
    },
  })

  wk.register({
    [','] = {
      name = 'LSP/Main',
      ['c'] = {
        name = 'Code',
        ['a'] = {vim.lsp.buf.code_action, 'Code action'},
      },
    },
  }, { mode = 'v' })

  wk.register({
    ['gd'] = {vim.lsp.buf.definition, 'Goto definition'},
    ['gD'] = {vim.lsp.buf.declaration, 'Goto declaration'},
    ['gi'] = {vim.lsp.buf.implementation, 'Find implementation'},
    ['<C-k>'] = {vim.lsp.buf.signature_help, 'Signature help'},
    ['K'] = {require("hover").hover, 'Hover action'},
    ['gK'] = {require("hover").hover_select, 'Hover action selecte provider'},
  }, { buffer = bufnr })

  local ft = vim.api.nvim_get_option_value('filetype', {buf = bufnr})
  local ok, ftkeymap = pcall(require, 'my_keymaps.filetype.' .. ft)
  if ok then
    ftkeymap.setup(client, bufnr)
  end
end

return M
