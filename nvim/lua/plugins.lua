-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        plugins = {
          spelling = { enabled = true },
        },
        window = { border = 'single' },
      }
    end
  }
  use 'neovim/nvim-lspconfig'
  use {
    'ms-jpq/coq_nvim', branch = 'coq',
    requires  = {
      {'ms-jpq/coq.artifacts', branch = 'artifacts'},
      {'ms-jpq/coq.thirdparty', branch = '3p'},
      {'kristijanhusak/vim-dadbod-completion'},
      {'folke/lua-dev.nvim'},
    },
    config = function()
      require('my_lsp_config').setup()
    end,
    setup = function()
      vim.g.coq_settings = {
        auto_start = true,
      }
    end
  }

  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-repeat'
  use 'lambdalisue/suda.vim'
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
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'nvim-treesitter/nvim-treesitter-textobjects'},
      {'RRethy/nvim-treesitter-endwise'},
      {'p00f/nvim-ts-rainbow'},
      {'nvim-treesitter/nvim-treesitter-context'},
      {'nvim-treesitter/nvim-treesitter-refactor'},
    },
    config = function()
      require('my_treesitter_config').setup()
    end
  }

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
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'ahmedkhalf/project.nvim'},
      {'nvim-telescope/telescope-live-grep-args.nvim'},
      {'nvim-telescope/telescope-packer.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      require('my_telescope_config').setup()
    end,
  }
  use 'justinmk/vim-sneak'
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      local picker = require'window-picker'
      picker.setup()
      vim.keymap.set("n", "<leader>w", function()
        local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end, { desc = "Pick a window" })
    end,
  }
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
    'kana/vim-textobj-user',
    requires = {
      'kana/vim-textobj-indent',
      'kana/vim-textobj-entire',
      'lucapette/vim-textobj-underscore',
    }
  }
  use 'wellle/targets.vim'
  use 'Yggdroot/indentLine'
  use 'pearofducks/ansible-vim'
  use 'vim-airline/vim-airline'
  use 'joshdick/onedark.vim'
  use {
    'rrethy/vim-hexokinase',
    cmd = {
      'HexokinaseToggle',
      'HexokinaseTurnOn',
      'HexokinaseTurnOff',
    },
    run = 'make hexokinase',
  }
  use 'editorconfig/editorconfig-vim'

  use {
    'tpope/vim-dadbod',
    cmd = {'DB'},
  }
  use {
    'kristijanhusak/vim-dadbod-ui',
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
      'DBUIRenameBuffer',
      'DBUILastQueryInfo',
    },
    after = 'vim-dadbod',
  }
  
  use 'sheerun/vim-polyglot'
  use 'fatih/vim-go'
end)
