local M = {}
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

local function toggle_conceal()
  local current_conceallevel = vim.api.nvim_get_option_value('conceallevel', {scope = 'local'})
  if current_conceallevel == 1 then current_conceallevel = 2 end
  vim.api.nvim_set_option_value('conceallevel', 2 - current_conceallevel, {scope = 'local'})
end

function M.setup()
  wk.add({
    {'<space>', group = 'Space'},
    {
      mode = 'n',
      {'<space>0', function() require'nvim-tree.api'.tree.focus() end, desc = 'Focus nvim-tree'},
      {'<space>1', function() focus_winnr(1) end, desc = 'Focus window 1'},
      {'<space>2', function() focus_winnr(2) end, desc = 'Focus window 2'},
      {'<space>3', function() focus_winnr(3) end, desc = 'Focus window 3'},
      {'<space>4', function() focus_winnr(4) end, desc = 'Focus window 4'},
      {'<space>5', function() focus_winnr(5) end, desc = 'Focus window 5'},
      {'<space>6', function() focus_winnr(6) end, desc = 'Focus window 6'},
      {'<space>7', function() focus_winnr(7) end, desc = 'Focus window 7'},
      {'<space>8', function() focus_winnr(8) end, desc = 'Focus window 8'},
      {'<space>9', function() focus_winnr(9) end, desc = 'Focus window 9'},
      {'<space>/', '<cmd>nohlsearch<cr>', desc = 'No search highlight'},
      {'<space>.', '<cmd>Telescope buffers<cr>', desc = 'Find buffer'},
      {'<space>>', '<cmd>Telescope find_files<cr>', desc = 'Find files'},
      {'<space>:', '<cmd>Telescope commands __hide_previewer=true<cr>', desc = 'List commands'},
      {'<space>`', function() vim.cmd('try | b# | catch | endtry') end, desc = 'Switch last buffer'},
      {'<space><TAB>', '<cmd>wincmd p<cr>', desc = 'Switch last window'},
      {'<space>x', function() MiniBufremove.delete(0) end, desc = 'Unload buffer'},
      {'<space>?', function() wk.show({global = false}) end, desc = 'Buffer local keymaps (which-key)'},
    },
    {'<space>b', group = 'Buffer'},
    {
      mode = 'n',
      {'<space>b1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Goto buffer 1'},
      {'<space>b2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Goto buffer 2'},
      {'<space>b3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Goto buffer 3'},
      {'<space>b4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Goto buffer 4'},
      {'<space>b5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'Goto buffer 5'},
      {'<space>b6', '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'Goto buffer 6'},
      {'<space>b7', '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'Goto buffer 7'},
      {'<space>b8', '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'Goto buffer 8'},
      {'<space>b9', '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'Goto buffer 9'},
      {'<space>b0', '<cmd>BufferLineGoToBuffer -1<cr>', desc = 'Goto last buffer'},
      {'<space>bb', '<cmd>BufferLinePick<cr>', desc = 'Pick buffer'},
      {'<space>bd', function() MiniBufremove.delete(0) end, desc = 'Unload buffer'},
      {'<space>bo', function() local close = require'bufferline'.close_in_direction; close('left'); close('right') end, desc = 'Close other buffers'},
      {'<space>bO', '<cmd>BufferLineCloseLeft<cr>|<cmd>BufferLineCloseRight<cr>', desc = 'Close other buffers (including pinned)'},
      {'<space>bu', function() require'bufferline'.close_in_direction('left') end, desc = 'Close buffers to left'},
      {'<space>bk', function() require'bufferline'.close_in_direction('right') end, desc = 'Close buffers to right'},
      {'<space>bD', function() MiniBufremove.delete(0) end, desc = 'Force unload buffer'},
      {'<space>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Pin current buffer'},
      {'<space>b/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search in buffer'},
      {'<space>bn', '<cmd>enew<cr>', desc = 'Create buffer'},
    },
    {'<space>c', group = 'Code'},
    {'<space>cr', group = 'Run'},
    {
      mode = 'n',
      {'<space>cs', '<cmd>ISwap<cr>', desc = 'ISwap'},
      {'<space>cS', '<cmd>ISwapNode<cr>', desc = 'ISwapNode'},
      {'<space>crf', '<cmd>SnipRun<cr>', desc = 'Run file'},
    },
    {'<space>crr', '<cmd>SnipRun<cr>', desc = 'SnipRun selected', mode = 'x'},
    {'<space>f', group = 'File & Fuzzy'},
    {
      mode = 'n',
      {'<space>f`', '<cmd>Telescope resume<cr>', desc = 'Resume last find'},
      {'<space>f"', '<cmd>Telescope registers<cr>', desc = 'Find registers'},
      {'<space>f/', '<cmd>Telescope builtin include_extensions=true __hide_previewer=true<cr>', desc = 'Telescope extensions'},
      {'<space>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files'},
      {'<space>fF', '<cmd>Telescope find_files hidden=true<cr>', desc = 'Find hidden files'},
      {'<space>ft', '<cmd>Telescope tags<cr>', desc = 'Find tags'},
      {'<space>fc', '<cmd>Telescope colorscheme __hide_previewer=true<cr>', desc = 'Find colorscheme'},
      {'<space>fs', '<cmd>w<cr>', desc = 'Save file'},
      {'<space>fS', '<cmd>SudaWrite<cr>', desc = 'Sudo save file'},
      {'<space>fp', '<cmd>Telescope lazy<cr>', desc = 'Find packages'},
      {'<space>fo', '<cmd>NvimTreeFindFile<cr>', desc = 'Find current buffer in nvim-tree'},
      {'<space>fy', function() require("telescope").extensions.yank_history.yank_history(require('telescope.themes').get_dropdown({
        initial_mode = 'normal',
      })) end, desc = 'Open yank ring'},
      {'<space>f=', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', desc = 'Format with LSP'},
      {'<space>f:', '<cmd>Telescope command_history<cr>', desc = 'Command history'},
    },
    {'<space>g', group = 'Git'},
    {
      mode = 'n',
      {'<space>gb', '<cmd>G blame<cr>', desc = 'Git Blame'},
      {'<space>gs', '<cmd>Git<cr>', desc = 'Git status'},
      {'<space>go', '<cmd>GBrowse<cr>', desc = 'Open in browser'},
      {'<space>gh', '<cmd>0Gclog<cr>', desc = 'Browse history of current file in quickfix'},
    },
    {'<space>h', group = 'Help'},
    {
      mode = 'n',
      {'<space>h/',  '<cmd>Telescope help_tags<cr>', desc = 'Search for help' },
    },
    {'<space>o', group = 'Open/Other'},
    {'<space>og', group = 'Git/GitHub'},
    {
      mode = 'n',
      {'<space>op', function() require'nvim-tree.api'.tree.toggle(true, true) end, desc = 'Open nvim-tree'},
      {'<space>oP', function()
        local nta = require('nvim-tree.api')
        nta.tree.find_file(vim.fn.expand('%:p'))
        nta.tree.focus()
      end, desc = 'Find current file in nvim-tree'},
      -- {'<space>oq', function() require'nvim-tree.api'.tree.close() end, desc = 'Open nvim-tree'},
      {'<space>ogf', '<cmd>GitBlameOpenFileURL<cr>', desc = 'Open file URL'},
      {'<space>ogc', '<cmd>GitBlameOpenCommitURL<cr>', desc = 'Open commit URL'},
    },
    {'<space>p', group = 'Project'},
    {
      mode = 'n',
      {'<space>pf', '<cmd>Telescope git_files show_untracked=true<cr>', desc = 'Find project files'},
    },
    {'<space>q', group = 'Quit'},
    {
      mode = 'n',
      {'<space>qq', '<cmd>qall<cr>', desc = 'Quit'},
      {'<space>qQ', '<cmd>qall!<cr>', desc = 'Force quit'},
    },
    {'<space>s', group = 'Search & Syntax'},
    {
      mode = 'n',
      {'<space>s/', '<cmd>Telescope live_grep_args<cr>', desc = 'Search in project'},
      {'<space>sP', '<cmd>Telescope grep_string<cr>', desc = 'Search word under cursor'},
      {'<space>ss', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Search symbols in buffer'},
      {'<space>sS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Search symbols in project'},
      {'<space>sr', '<cmd>Telescope lsp_references<cr>', desc = 'Search references'},
      {'<space>sd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Search definitions'},
      {'<space>si', '<cmd>Telescope lsp_implementations<cr>', desc = 'Search definitions'},
    },
    {'<space>t', group = 'Toggles'},
    {
      mode = 'n',
      {'<space>tb', '<cmd>GitBlameToggle<cr>', desc = 'Toggle git blame'},
      {'<space>ti', '<cmd>IndentLinesToggle<cr>', desc = 'Toggle indent guide'},
      {'<space>tu', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undotree'},
      {'<space>tT', '<cmd>TableModeToggle<cr>', desc = 'Toggle table mode'},
      {'<space>tc', toggle_conceal, desc = 'Toggle conceal'},
    },
    {'<space>v', group = 'Vim'},
    {'<space>ve', group = 'Eval'},
    {'<space>vf', group = 'Vim config'},
    {
      mode = 'n',
      {'<space>vp', '<cmd>Lazy<cr>', desc = 'Lazy'},
      {'<space>vef', '<cmd>LuaRun<cr>', desc = 'Run current lua file in nvim'},
      {'<space>vep', '<cmd>Luapad<cr>', desc = 'Open Luapad'},
      {'<space>vfd', '<cmd>edit $MYVIMRC<cr>', desc = 'Edit init.vim'},
      {'<space>vfs', function()
        require('telescope.builtin').find_files({search_dirs = {utils.conf_dir}})
      end, desc = 'Find file in config dir'},
      {'<space>vfp', string.format('<cmd>edit %s<cr>', utils.file_in_conf_dir('lua/my_plugins.lua')), desc = 'Edit plugins'},
    },
    {'<space>w', group = 'Window'},
    {
      mode = 'n',
      {'<space>wl', '<cmd>wincmd l<cr>', desc = 'Left'},
      {'<space>wh', '<cmd>wincmd h<cr>', desc = 'Right'},
      {'<space>wj', '<cmd>wincmd j<cr>', desc = 'Down'},
      {'<space>wk', '<cmd>wincmd k<cr>', desc = 'Up'},
      {'<space>wL', '<cmd>wincmd L<cr>', desc = 'Move window to leftmost'},
      {'<space>wH', '<cmd>wincmd H<cr>', desc = 'Move window to rightmost'},
      {'<space>wJ', '<cmd>wincmd J<cr>', desc = 'Move window to bottom'},
      {'<space>wK', '<cmd>wincmd K<cr>', desc = 'Move window to top'},
      {'<space>w`', '<cmd>wincmd p<cr>', desc = 'Focus previous window'},
      {'<space>wp', '<cmd>wincmd P<cr>', desc = 'Focus preview window'},
      {'<space>wP', '<cmd>wincmd z<cr>', desc = 'Close preview window'},
      {'<space>wz', '<cmd>wincmd z<cr>', desc = 'Close preview window'},
      {'<space>w_', '<cmd>wincmd _<cr>', desc = 'Max out height'},
      {'<space>w|', '<cmd>wincmd |<cr>', desc = 'Max out weight'},
      {'<space>w/', '<cmd>vs<cr>', desc = 'Split vertically'},
      {'<space>ws', '<cmd>sp<cr>', desc = 'Split horizontally'},
      {'<space>wf', '<cmd>NvimTreeFocus<cr>', desc = 'Focus nvim-tree'},
      {'<space>wd', '<cmd>close<cr>', desc = 'Close window'},
      {'<space>wD', '<cmd>close!<cr>', desc = 'Close window'},
      {'<space>w=', '<cmd>wincmd =<cr>', desc = 'Balance hiehgt and width'},
      {'<space>wn', '<cmd>new<cr>', desc = 'Create window'},
    },
    {'<space>y', group = 'Yank'},
    {'<space>yg', group = 'Git/GitHub'},
    {
      mode = 'n',
      {'<space>y.', function() vim.fn.setreg('+', vim.fn.expand('%')) end, desc = "Copy current buffer's relative path"},
      {'<space>y>', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end, desc = "Copy current buffer's absolute path"},
      {'<space>yc', function() vim.fn.setreg('+', vim.fn.getcwd()) end, desc = 'Copy cwd'},
      {'<space>ygf', '<cmd>GitBlameCopyFileURL<cr>', desc = ' Copy file URL'},
      {'<space>ygc', '<cmd>GitBlameCopyCommitURL<cr>', desc = ' Copy commit URL'},
      {'<space>ygh', '<cmd>GitBlameCopySHA<cr>', desc = ' Copy commit SHA'},
    },
  })
end

function M.local_keymaps(client, bufnr)
  wk.add({
    {'d', group = 'Diagnostics'},
    {
      mode = 'n',
      buffer = bufnr,
      {'<space>dh', function() vim.diagnostic.hide(nil, bufnr) end, desc = 'Hide diagnostics'},
      {'<space>ds', function() vim.diagnostic.show(nil, bufnr) end, desc = 'Show diagnostics'},
      {'<space>dD', function() vim.diagnostic.disable(bufnr) end, desc = 'Disable diagnostics'},
      {'<space>dS', function() vim.diagnostic.enable(bufnr) end, desc = 'Enable diagnostics'},
      {'<space>dd', "<cmd>Trouble document_diagnostics<cr>", desc = 'Show diagnostics in Trouble'},
      {'<space>dw', "<cmd>Trouble workspace_diagnostics<cr>", desc = 'Show workspace diagnostics in Trouble'},
    },
  })
end

return M
