-- lazy Plugin Specs. See https://github.com/folke/lazy.nvim#-structuring-your-plugins

local pluginSpecs = {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = {
        spelling = { enabled = true },
      },
      window = { border = 'single' },
      operators = {
        gc = 'Comments',
        gb = 'BlockComments',
      },
    }
  },
  'b0o/SchemaStore.nvim',
  'folke/trouble.nvim',
  {
    "lewis6991/hover.nvim",
    opts = {
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        require('hover.providers.gh')
        -- require('hover.providers.jira')
        require('hover.providers.man')
        require('hover.providers.dictionary')
      end,
      preview_opts = {
        border = 'single'
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = true,
      title = true,
    },
    config = function(lazy, opts)
      local hover = require('hover')
      hover.setup(opts)
      -- Setup keymaps
      vim.keymap.set("n", "K", hover.hover, {desc = "hover.nvim"})
      vim.keymap.set("n", "gK", hover.hover_select, {desc = "hover.nvim (select)"})
    end,
  },
  {
    'folke/neodev.nvim',
    opts = {
      override = function(root_dir, library)
        if root_dir:find('dotfiles', 1, true) ~= nil then
          library.enabled = true
          library.runtime = true
          library.types   = true
          library.plugins = true
        end
      end,
    },
    config = true,
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
  {
    'kylechui/nvim-surround',
    version = "*",
    config = true,
  },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-repeat',
  'lambdalisue/suda.vim',
  'mbbill/undotree',
  'dhruvasagar/vim-table-mode',
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('my_configs.bufferline').setup()
    end
  },
  {
    'xolox/vim-session',
    dependencies = {'xolox/vim-misc'},
  },
  'jeffkreeftmeijer/vim-numbertoggle',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      local ft = require('Comment.ft')
      ft.Jenkinsfile = {'//%s', '/*%s*/'}
      ft.jenkinsfile = {'//%s', '/*%s*/'}
    end
  },
  'AndrewRadev/splitjoin.vim',
  {
    'lewis6991/gitsigns.nvim',
    config = true
  },
  {
    'f-person/git-blame.nvim',
    config = true,
    opts = {
      enabled = false,
    },
  },
  {'andymass/vim-matchup', event = 'VimEnter'},
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      -- {'nvim-treesitter/nvim-treesitter-textobjects'},
      {'nvim-treesitter/nvim-treesitter-context'},
      {'nvim-treesitter/nvim-treesitter-refactor'},
      {'RRethy/nvim-treesitter-endwise'},
      {'JoosepAlviste/nvim-ts-context-commentstring'},
      {'windwp/nvim-ts-autotag'},
    },
    config = function()
      require('my_treesitter_config').setup()
    end
  },
  -- {
  --   'nvim-orgmode/orgmode',
  --   config = function()
  --     require('orgmode').setup_ts_grammar()
  --     require('orgmode').setup {
  --       org_agenda_files = {'~/my-orgs/**/*'},
  --       org_default_notes_file = '~/my-orgs/notes.org',
  --       org_todo_keywords = {
  --         'TODO', 'NEXT', 'HOLD', '|', 'DONE', 'ARCHIVED',
  --       },
  --       org_todo_keyword_faces = {
  --         NEXT = ':background #61C6F2 :foreground #EC6238 :weight bold :slant italic',
  --         HOLD = ':background #FFFFFF :foreground #F64E59 :underline on',
  --       }
  --     }
  --   end,
  -- },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = {"jk", "jj"}, -- a table with mappings to use
      timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      -- keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
      -- example(recommended)
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      end,
    }
  },
  {
    'gbprod/yanky.nvim',
    dependencies = {
      "kkharji/sqlite.lua",
    },
    config = function()
      local utils = require("yanky.utils")
      local mapping = require("yanky.telescope.mapping")
      require('yanky').setup({
        ring = {
          history_length = 9999,
          storage = "sqlite",
        },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = {
              default = mapping.put('p'),
              i = {
                ["<c-x>"] = mapping.delete(),
                ["<c-r>"] = mapping.set_register(utils.get_default_register()),
              },
              n = {
                ['p'] = mapping.put('p'),
                ['P'] = mapping.put('P'),
                ['d'] = mapping.delete(),
                ['r'] = mapping.set_register(utils.get_default_register()),
                ['[p'] = mapping.special_put('YankyPutIndentBeforeLinewise'),
                [']p'] = mapping.special_put('YankyPutIndentAfterLinewise'),
                ['=p'] = mapping.special_put('YankyPutAfterFilter'),
                ['=P'] = mapping.special_put('YankyPutBeforeFilter'),
                ['J'] = mapping.special_put('YankyPutAfterJoined'),
                ['[J'] = mapping.special_put('YankyPutIndentBeforeJoined'),
                [']J'] = mapping.special_put('YankyPutIndentAfterJoined'),
              }
            }
          }
        }
      })
      require('telescope').load_extension('yank_history')
    end,
  },
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      -- {'ahmedkhalf/project.nvim'},
      -- 'nvim-telescope/telescope-packer.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'tsakirist/telescope-lazy.nvim',
    },
    config = require('my_telescope_config').setup,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end
  },
  {
    'smoka7/hop.nvim',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    }
  },
  'mizlan/iswap.nvim',
  -- 'rhysd/clever-f.vim',
  'bkad/CamelCaseMotion',
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    -- branch = 'nightly' -- optional, updated every week. (see issue #1193)
    opts = {
      sync_root_with_cwd  = true,
      respect_buf_cwd     = true,
      prefer_startup_root = true,
      select_prompts      = true,
      update_focused_file = {
        enable      = true,
        update_root = true,
      },
      renderer = {
        group_empty = false,
        highlight_opened_files = 'all',
      },
      filters = {
        git_ignored = false,
        dotfiles    = false,
        custom      = {
          "^\\.null-ls_.\\+",
        },
      },
      view = {
        debounce_delay = 100,
        relativenumber = true,
      }
    }
  },
  -- {
  --   'kana/vim-textobj-user',
  --   dependencies = {
  --     'kana/vim-textobj-indent',
  --     'kana/vim-textobj-entire',
  --     'lucapette/vim-textobj-underscore',
  --   }
  -- },
  -- 'wellle/targets.vim',
  -- 'Yggdroot/indentLine',
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  'pearofducks/ansible-vim',
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    config = function()
      require'my_statusline'
    end
  },
  {'olimorris/onedarkpro.nvim', lazy = true},
  {'ellisonleao/gruvbox.nvim', lazy = true},
  'editorconfig/editorconfig-vim',
  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
    -- config = function()
    --   require'colorizer'.setup()
    -- end
  },
  {
    'sheerun/vim-polyglot',
    init = function()
      vim.g.polyglot_disabled = {
        'autoindent',
      }
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_auto_insert_bullets = 0
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.no_csv_maps = 1
    end,
  },
  'darfink/vim-plist',
  'tpope/vim-sleuth',
  {
    'fatih/vim-go',
    init = function()
      vim.g.go_code_completion_enabled = 0
      vim.g.go_doc_keywordprg_enabled = 1
      vim.g.go_def_mapping_enabled = 0
    end
  },
  {
    'rafcamlet/nvim-luapad',
    cmd = {'Luapad', 'LuaRun'}
  },
  'junegunn/vim-easy-align'
}

if vim.g.completion_engine ~= nil then
  local loaded, engine = pcall(require, 'my_completion_engine.' .. vim.g.completion_engine)
  if loaded then
    engine.setup(pluginSpecs)
    require('my_lsp_configs').setup(pluginSpecs, engine.ensure_capabilities)
  else
    vim.notify("Completion engine " .. vim.g.completion_engine .. " not found!", vim.log.levels.ERROR)
  end
end

return pluginSpecs
