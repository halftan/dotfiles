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

wk.register({
  ['0'] = {'<cmd>NvimTreeFocus<cr>', 'Focus nvim-tree'},
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

  ['<space>'] = {
    name = 'Hop',
    ['j'] = {'<cmd>HopLineStartAC<cr>', 'Line below'},
    ['k'] = {'<cmd>HopLineStartBC<cr>', 'Line above'},
    ['/'] = {'<cmd>HopChar2<cr>', '2 char jump'},
    ['f'] = {'<cmd>HopChar1AC<cr>', '1 char forward'},
    ['F'] = {'<cmd>HopChar1BC<cr>', '1 char backward'},
    ['w'] = {'<cmd>HopWordAC<cr>', 'Word jump forward'},
    ['b'] = {'<cmd>HopWordBC<cr>', 'Word jump backward'},
  },

  ['w'] = {
    name = 'Window',
    ['l'] = {'<cmd>wincmd l<cr>', 'Left'},
    ['h'] = {'<cmd>wincmd h<cr>', 'Right'},
    ['j'] = {'<cmd>wincmd j<cr>', 'Down'},
    ['k'] = {'<cmd>wincmd k<cr>', 'Up'},
    ['L'] = {'<cmd>wincmd L<cr>', 'Move window to leftmost'},
    ['H'] = {'<cmd>wincmd H<cr>', 'Move window to rightmost'},
    ['J'] = {'<cmd>wincmd J<cr>', 'Move window to bottom'},
    ['K'] = {'<cmd>wincmd K<cr>', 'Move window to top'},
    ['/'] = {'<cmd>vs<cr>', 'Split vertically'},
    ['s'] = {'<cmd>sp<cr>', 'Split horizontally'},
    ['f'] = {'<cmd>NvimTreeFocus<cr>', 'Focus nvim-tree'},
		['d'] = {'<cmd>close<cr>', 'Close window'},
		['D'] = {'<cmd>close!<cr>', 'Close window'},
  },

  ['g'] = {
    name = 'Git',
    ['s'] = {'<cmd>Git<cr>', 'Git status'},
  },

  ['p'] = {
    name = 'Project',
    ['f'] = {'<cmd>Telescope git_files show_untracked=true<cr>', 'Find project files'},
    ['p'] = {'<cmd>Telescope projects<cr>', 'Find and switch project'},
  },

  ['f'] = {
    name = 'File & Fuzzy',
    ['s'] = {'<cmd>w<cr>', 'Save file'},
    ['S'] = {'<cmd>SudaWrite<cr>', 'Sudo save file'},
    ['/'] = {'<cmd>Telescope builtin include_extensions=true __hide_previewer=true<cr>', 'Telescope extensions'},
    ['f'] = {'<cmd>Telescope find_files<cr>', 'Find files'},
    ['F'] = {'<cmd>Telescope find_files hidden=true<cr>', 'Find hidden files'},
    ['t'] = {'<cmd>Telescope tags<cr>', 'Find tags'},
    ['c'] = {'<cmd>Telescope colorscheme __hide_previewer=true<cr>', 'Find colorscheme'},
    ['"'] = {'<cmd>Telescope registers<cr>', 'Find registers'},
    ['r'] = {'<cmd>Telescope resume<cr>', 'Resume last find'},
    ['p'] = {'<cmd>Telescope packer __hide_previewer=true<cr>', 'Find packages'},
    ['o'] = {'<cmd>NvimTreeFindFile<cr>', 'Find current buffer in nvim-tree'},
    ['y'] = {function() vim.fn.setreg('+', vim.fn.expand('%')) end, "Copy current buffer's relative path"},
    ['Y'] = {function() vim.fn.setreg('+', vim.fn.expand('%:p')) end, "Copy current buffer's absolute path"},
  },

  ['b'] = {
    name = 'Buffer',
    ['1'] = {'<cmd>BufferGoto 1<cr>', 'Goto buffer 1'},
    ['2'] = {'<cmd>BufferGoto 2<cr>', 'Goto buffer 2'},
    ['3'] = {'<cmd>BufferGoto 3<cr>', 'Goto buffer 3'},
    ['4'] = {'<cmd>BufferGoto 4<cr>', 'Goto buffer 4'},
    ['5'] = {'<cmd>BufferGoto 5<cr>', 'Goto buffer 5'},
    ['6'] = {'<cmd>BufferGoto 6<cr>', 'Goto buffer 6'},
    ['7'] = {'<cmd>BufferGoto 7<cr>', 'Goto buffer 7'},
    ['8'] = {'<cmd>BufferGoto 8<cr>', 'Goto buffer 8'},
    ['9'] = {'<cmd>BufferGoto 9<cr>', 'Goto buffer 9'},
    ['0'] = {'<cmd>BufferLast<cr>', 'Goto last buffer'},
    ['b'] = {'<cmd>BufferPick<cr>', 'Pick buffer'},
    ['d'] = {'<cmd>BufferClose<cr>', 'Unload buffer'},
    ['o'] = {'<cmd>BufferCloseAllButCurrentOrPinned<cr>', 'Close other buffers'},
    ['O'] = {'<cmd>BufferCloseAllButCurrent<cr>', 'Close other buffers (including pinned)'},
    ['D'] = {'<cmd>BufferClose!<cr>', 'Force unload buffer'},
    ['p'] = {'<cmd>BufferPin<cr>', 'Pin current buffer'},
    ['/'] = {'<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Search in buffer'},
  },

  ['c'] = {
    name = 'Code',
    ['r'] = {
      name = 'Run',
      ['f'] = {'<cmd>SnipRun<cr>', 'Run file'},
    },
  },

  ['s'] = {
    name = 'Search & Syntax',
    ['/'] = {'<cmd>Telescope live_grep_args<cr>', 'Search in project'},
    ['P'] = {'<cmd>Telescope grep_string<cr>', 'Search word under cursor'},
    ['s'] = {'<cmd>Telescope lsp_document_symbols<cr>', 'Search symbols in buffer'},
    ['S'] = {'<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Search symbols in buffer'},
  },

  ['h'] = {
    name = 'Help',
    ['/'] = {'<cmd>Telescope help_tags<cr>', 'Search for help'},
  },

  ['o'] = {
    name = 'Other',
    ['p'] = {function() require'nvim-tree'.focus() end, 'Open nvim-tree'},
    ['P'] = {function() require'nvim-tree'.find_file(vim.fn.expand('%:p')) end, 'Find current file in nvim-tree'},
  },

  ['q'] = {
    name = 'Quit',
    ['q'] = {'<cmd>quit<cr>', 'Quit'},
    ['Q'] = {'<cmd>qall!<cr>', 'Force quit'},
  },

  ['t'] = {
    name = 'Toggles',
    ['i'] = {'<cmd>IndentLinesToggle<cr>', 'Toggle indent guide'},
    ['u'] = {'<cmd>UndotreeToggle<cr>', 'Toggle Undotree'},
    ['T'] = {'<cmd>TableModeToggle<cr>', 'Toggle table mode'},
  },

  ['v'] = {
    name = 'Vim',
    ['p'] = {
      name = 'Packages',
      ['i'] = {'<cmd>PackerInstall<cr>', 'PackerInstall'},
      ['s'] = {'<cmd>PackerSync<cr>', 'PackerSync'},
      ['c'] = {'<cmd>PackerCompile<cr>', 'PackerCompile'},
      ['C'] = {'<cmd>PackerClean<cr>', 'PackerClean'},
    },
    ['e'] = {
      name = 'Eval',
      ['f'] = {'<cmd>LuaRun<cr>', 'Run current lua file in nvim'},
      ['p'] = {'<cmd>Luapad<cr>', 'Open Luapad'},
    },

    ['f'] = {
      name = 'Vim config',
      ['d'] = {'<cmd>edit $MYVIMRC<cr>', 'Edit init.vim'},
      ['s'] = {function()
        require('telescope.builtin').find_files({search_dirs = {utils.conf_dir}})
      end, 'Find file in config dir'},
      ['p'] = {string.format('<cmd>edit %s<cr>', utils.file_in_conf_dir('lua/my_plugins.lua')), 'Edit plugins'},
    },
  },

  [','] = {
    name = 'Current lang',
  },
}, { prefix = '<space>' })

return {}
