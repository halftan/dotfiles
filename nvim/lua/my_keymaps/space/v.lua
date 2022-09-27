local wk = require('which-key')
local utils = require('my_utils')

wk.register({
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
}, { prefix = '<space>' })

return {}
