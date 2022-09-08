sub_keymaps = {'space', 'leader'}

for _, v in pairs(sub_keymaps) do
  pcall(require, 'my_keymaps.' .. v)
end

local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['<c-p>'] = {'<cmd>Telescope find_files hidden=true<cr>', 'Find files'},
  ['H'] = {function()
    if vim.fn.tabpagenr('$') > 1 then
      vim.cmd('normal gT')
    else
      vim.cmd('bprevious')
    end
  end, 'Previous tab'},
  ['L'] = {function()
    if vim.fn.tabpagenr('$') > 1 then
      vim.cmd('normal gt')
    else
      vim.cmd('bnext')
    end
  end, 'Next tab'},
})

return {}
