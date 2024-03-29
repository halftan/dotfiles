local M = {}

M.setup = function(use)
  use {
    'ms-jpq/coq_nvim', branch = 'coq',
    after = 'nvim-lspconfig',
    requires = {
      -- {'ms-jpq/coq.artifacts', branch = 'artifacts'},
      -- {'honza/vim-snippets'},
      {'ms-jpq/coq.thirdparty', branch = '3p'},
      {'kristijanhusak/vim-dadbod-completion'},
    },
    config = function()
      local coq = require 'coq'
      require('my_lsp_config').setup(coq.lsp_ensure_capabilities)

      require('coq_3p') {
        -- { src = 'nvimlua', short_name = 'nLUA', conf_only = false },
        { src = 'builtin/syntax', short_name = 'SYN' },
        { src = 'vim_dadbod_completion', short_name = 'DB' },
        {
          src = 'repl',
          sh = 'bash',
          shell = {
            p = 'python3',
            n = 'node',
            t = 'deno',
            r = 'ruby',
            sh = 'bash',
          },
          max_lines = 200,
          deadline = 500,
          unsafe = {'rm', 'poweroff', 'mv', 'ssh'},
        },
        { src = 'orgmode', short_name = 'ORG' },
      }

      if _G.packer_plugins['vim-snippets'] ~= nil then
        vim.g.coq_settings = {
          ['clients.snippets.user_path'] = _G.packer_plugins['vim-snippets'].path .. '/UltiSnips',
        }
      else
        vim.notify_once('vim-snippets not loaded.', vim.log.levels.WARN)
      end
    end,
    setup = function()
      vim.g.coq_settings = {
        auto_start = true,
        keymap = {
          recommended = false,
        },
      }
    end
  }
end

M.autopairs_setup = function()
  local remap = vim.api.nvim_set_keymap
  local npairs = require('nvim-autopairs')

  npairs.setup({
    map_bs = false,
    map_cr = false,
  })

  -- these mappings are coq recommended mappings unrelated to nvim-autopairs
  remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
  remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
  remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
  remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

  -- skip it, if you use another global object
  _G.MUtils= {}

  MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        return npairs.esc('<c-y>')
      else
        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
      end
    else
      return npairs.autopairs_cr()
    end
  end
  remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

  MUtils.BS = function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
      return npairs.esc('<c-e>') .. npairs.autopairs_bs(bufnr)
    else
      return npairs.autopairs_bs(bufnr)
    end
  end
  remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
end

return M
