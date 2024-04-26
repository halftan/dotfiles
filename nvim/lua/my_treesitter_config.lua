return {
  setup = function()
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = {
        "go", "gomod", "bash", "dockerfile", "make", "lua", "org",
        "vim", "comment", "python", "json", "yaml", "toml", "ssh_config",
        "markdown", "markdown_inline", "csv",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      -- List of parsers to ignore installing (for "all")
      ignore_install = {},

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {
          "groovy",
          -- "markdown", "markdown_inline",
        },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = {
          "vim", "org", "markdown", "yaml"
        },
      },

      indent = {
        enable = true,
        disable = {"yaml"},
      },

      endwise = {
        enable = true
      },

      textobjects = {
        select = {
          enable = false,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
          -- You can choose the select mode (default is charwise 'v')
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding xor succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          include_surrounding_whitespace = false,
        },
      },

      refactor = {
        highlight_definitions = {
          clear_on_cursor_move = true,
          enable = true,
        },
        highlight_current_scope = {
          enable = false,
        },
        smart_rename = {
          enable = false,
          keymaps = {
            smart_rename = "grr",
          },
        },
        navigation = {
          enable = false,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-8>",
            goto_previous_usage = "<a-3>",
          },
        },
      },

      autotag = {
        enable = true,
      },

      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

    }
  end
}
