local wk = require('which-key')

local utils = require('my_utils')

local function focus_winnr(nr)
  if vim.api.nvim_buf_get_option(vim.fn.winbufnr(1), 'filetype') == 'NvimTree' then
    nr = nr + 1
  end

  if vim.fn.winnr('$') >= nr then
    vim.api.nvim_command(nr .. 'wincmd w')
  end
end

utils.load_all_in_path(utils.file_in_conf_dir('lua/my_keymaps/space'))

wk.register({
  ['0'] = {function() require'nvim-tree.api'.tree.focus() end, 'Focus nvim-tree'},
  ['1'] = {function() focus_winnr(1) end, 'Focus window 1'},
  ['2'] = {function() focus_winnr(2) end, 'Focus window 2'},
  ['3'] = {function() focus_winnr(3) end, 'Focus window 3'},
  ['4'] = {function() focus_winnr(4) end, 'Focus window 4'},
  ['5'] = {function() focus_winnr(5) end, 'Focus window 5'},
  ['6'] = {function() focus_winnr(6) end, 'Focus window 6'},
  ['7'] = {function() focus_winnr(7) end, 'Focus window 7'},
  ['8'] = {function() focus_winnr(8) end, 'Focus window 8'},
  ['9'] = {function() focus_winnr(9) end, 'Focus window 9'},
  ['/'] = {'<cmd>nohlsearch<cr>', 'No search highlight'},
  ['.'] = {'<cmd>Telescope buffers<cr>', 'Find buffer'},
  [':'] = {'<cmd>Telescope commands __hide_previewer=true<cr>', 'List commands'},
  ['`'] = {function() vim.cmd('try | b# | catch | endtry') end, 'Switch last buffer'},
  ['<TAB>'] = {'<cmd>wincmd p<cr>', 'Switch last window'},
}, { prefix = '<space>' })

return {}
