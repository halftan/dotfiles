-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'

  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-repeat'
  use 'mbbill/undotree'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'tomtom/tcomment_vim'
  use 'AndrewRadev/splitjoin.vim'
  use 'jiangmiao/auto-pairs'
  use 'airblade/vim-gitgutter'
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use {
    'w0rp/ale',
    ft = {
      'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown',
      'racket', 'vim', 'tex', 'python', 'ruby',
    },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  use 'nvim-treesitter/nvim-treesitter'

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = {"jk", "jj"}, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        -- keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        keys = function()
          return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        end,
      })
    end,
  }
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'justinmk/vim-sneak'
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use 'rhysd/clever-f.vim'
  use 'bkad/CamelCaseMotion'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    config = function()
      require('nvim-tree').setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end
  }
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    {'kana/vim-textobj-indent', requires = {'kana/vim-textobj-user'}},
    'kana/vim-textobj-entire',
    'lucapette/vim-textobj-underscore',
  }
  use 'Yggdroot/indentLine'
  use 'kien/rainbow_parentheses.vim'
  use 'sheerun/vim-polyglot'
  use 'vim-airline/vim-airline'
  use 'joshdick/onedark.vim'
end)
