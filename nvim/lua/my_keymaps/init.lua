sub_keymaps = {'space', 'leader'}

for _, v in pairs(sub_keymaps) do
  pcall(require, 'my_keymaps.' .. v)
end

local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['<c-p>'] = {'<cmd>Telescope find_files hidden=true<cr>', 'Find files'},
  ['H'] = {"(tabpagenr('$') > 1) ? 'gT' : '<cmd>bprevious<cr>'", 'Previous tab'},
  ['L'] = {"(tabpagenr('$') > 1) ? 'gt' : '<cmd>bnext<cr>'", 'Next tab'},
})

return {}
