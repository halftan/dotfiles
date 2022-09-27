local M = {}

M.setup = function(use)
  use {
    'hrsh7th/nvim-cmp',
    after = {'nvim-lspconfig', 'SchemaStore.nvim'},
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-nvim-lua'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      {'kristijanhusak/vim-dadbod-completion'},
      {'rafamadriz/friendly-snippets'},
      {'onsails/lspkind.nvim'},
    },
    config = function()
      vim.cmd [[set completeopt=menu,menuone,noselect]]

      local cmp = require('cmp')
      local lspkind = require('lspkind')

      local source_buffer = {
        name = 'buffer',
        {
          get_bufnrs = function()
            local buf = vim.api.nvim_get_current_buf()
            local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
            if byte_size > 2 * 1024 * 1024 then -- 2 Megabyte max
              return {}
            end
            return { buf }
          end
        },
        max_item_count = 10,
      }
      local global_sources = {
        {
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        },
        {
          source_buffer,
          {
            name = 'path',
            trigger_characters = {'.', '/'},
          },
        },
      }
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")

      cmp.setup({
        matching = {
          disallow_prefix_unmatching = true,
        },
        -- sorting = {
        --   comparators = nil,
        -- },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = function(fallback)
            if cmp.visible() then
              cmp.mapping.scroll_docs(-4)
            else
              fallback()
            end
          end,
          ['<C-d>'] = function(fallback)
            if cmp.visible() then
              cmp.mapping.scroll_docs(4)
            else
              fallback()
            end
          end,
          ['<C-j>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<C-S-J>'] = function(fallback)
            if cmp.visible() then
              local i = 0
              while i < 7 do
                cmp.select_next_item()
                i = i + 1
              end
            else
              fallback()
            end
          end,
          ['<C-S-K>'] = function(fallback)
            if cmp.visible() then
              local i = 0
              while i < 7 do
                cmp.select_prev_item()
                i = i + 1
              end
            else
              fallback()
            end
          end,
          ['<C-k>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<C-s>'] = cmp.mapping.complete({
            config = {
              sources = {
                { name = 'luasnip' }
              }
            }
          })
        }),

        sources = cmp.config.sources(unpack(global_sources)),

        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 60, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            menu = {
              buffer = '[buf]',
              nvim_lsp = '[λ]',
              path = '[path]',
              ['vim-dadbod-completion'] = '[DB]',
              orgmode = '[org]',
              cmdline = '[cmd]',
              luasnip = '[SNIP]',
            },

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function (entry, vim_item)
            --   return vim_item
            -- end
          })
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          source_buffer,
        })
      })

      cmp.setup.filetype({'sql', 'mysql', 'plsql'}, {
        sources = cmp.config.sources(unpack(global_sources), {
          { name = 'vim-dadbod-completion' },
        })
      })

      -- cmp.setup.filetype('lua', {
      --   sources = cmp.config.sources(unpack(global_sources), {
      --     { name = 'nvim_lua' },
      --   })
      -- })

      cmp.setup.filetype('org', {
        sources = cmp.config.sources(unpack(global_sources), {
          { name = 'orgmode' },
        })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          source_buffer,
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          },
          {
            { name = 'cmdline' }
          }
        )
      })

      -- Set up lspconfig.
      local function ensure_capabilities(lspconf)
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        lspconf['capabilities'] = capabilities
        return lspconf
      end
      require('my_lsp_config').setup(ensure_capabilities)
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  }
end

M.autopairs_setup = function()
  require('nvim-autopairs').setup({})
end

return M
