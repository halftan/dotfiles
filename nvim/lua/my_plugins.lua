-- lazy Plugin Specs. See https://github.com/folke/lazy.nvim#-structuring-your-plugins

local pluginSpecs = {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = "modern",
      plugins = {
        spelling = {
          enabled = true
        },
      },
      win = {
        border = 'single'
      },
    }
  },
  'b0o/SchemaStore.nvim',
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
    {
      "<space>dD",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workspace Diagnostics (Trouble)",
    },
    {
      "<space>dd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<space>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<space>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<space>dl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<space>dq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },

  },
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
      vim.keymap.set("n", "K", hover.hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", hover.hover_select, { desc = "hover.nvim (select)" })
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
    version = "*",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('my_configs.bufferline').setup()
    end
  },
  {
    'xolox/vim-session',
    dependencies = { 'xolox/vim-misc' },
  },
  'jeffkreeftmeijer/vim-numbertoggle',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      local ft = require('Comment.ft')
      ft.Jenkinsfile = { '//%s', '/*%s*/' }
      ft.jenkinsfile = { '//%s', '/*%s*/' }
    end
  },
  -- {
  --   'AndrewRadev/splitjoin.vim',
  --   config = function()
  --     vim.g["splitjoin_split_mapping"] = ''
  --     vim.g["splitjoin_join_mapping"] = ''
  --   end
  -- },
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
  {
    'andymass/vim-matchup',
    event = 'VimEnter'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      -- {'nvim-treesitter/nvim-treesitter-textobjects'},
      { 'nvim-treesitter/nvim-treesitter-context' },
      -- { 'nvim-treesitter/nvim-treesitter-refactor' },
      { 'RRethy/nvim-treesitter-endwise' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
      { 'windwp/nvim-ts-autotag' },
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
    config = true,
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
          history_length = 999,
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
              }
            }
          }
        }
      })
      require('telescope').load_extension('yank_history')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
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
  -- {
  --   'smoka7/hop.nvim',
  --   opts = {
  --     keys = 'etovxqpdygfblzhckisuran',
  --   }
  -- },
  {
    "mizlan/iswap.nvim",
    event = "VeryLazy",
    opts = {
      autoswap = true,
    },
  },
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
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = 'ibl',
  --   opts = {},
  -- },
  'pearofducks/ansible-vim',
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    config = function()
      require 'my_statusline'
    end
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    opts = {
      styles = {
        types = 'bold',
        methods = 'italic',
        functions = 'italic',
        constants = 'bold',
        keywords = 'bold',
      }
    },
  },
  {'ellisonleao/gruvbox.nvim',  priority = 1000},
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      dim_inactive = {
        enabled = true,
      },
      styles = {
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {'bold'},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {'bold'},
        operators = {},
      }
    }
  },
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
    end,
  },
  {
    'rafcamlet/nvim-luapad',
    cmd = {'Luapad', 'LuaRun'}
  },
  -- 'junegunn/vim-easy-align',
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function(lazyPlugin, opts)
      require('mini.bufremove').setup()
      require('mini.align').setup()

      require('mini.ai').setup({
        custom_textobjects = {
          e = function()
            local from = { line = 1, col = 1 }
            local to = {
              line = vim.fn.line('$'),
              col = math.max(vim.fn.getline('$'):len(), 1)
            }
            return { from = from, to = to }
          end
        }
      })

      require('mini.bracketed').setup()
      require('mini.indentscope').setup()
      require('mini.trailspace').setup()
      require('mini.jump').setup()
      require('mini.jump2d').setup()
      require('mini.splitjoin').setup({
        mappings = {
          toggle = '<leader>a',
          split = '<leader>s',
          join = '<leader>j',
        }
      })
    end
  },
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
