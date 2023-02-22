local M = {}

-- See https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- for all sources

M.setup = function()
  local null_ls = require('null-ls')
  null_ls.setup({
    on_attach = require'my_lsp_config'.on_attach_func,
    sources = {
      -- Shell
      -- null_ls.builtins.code_actions.shellcheck,
      -- null_ls.builtins.diagnostics.shellcheck,

      -- Diagnostics
      null_ls.builtins.diagnostics.selene,
      null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.diagnostics.ansiblelint.with({
        args = { "-c", vim.fn.expand("~/git/dotfiles/ansible-lint.yaml"), "-f", "codeclimate", "-q", "--nocolor", "$FILENAME" }
      }),
      null_ls.builtins.diagnostics.trail_space,
      null_ls.builtins.diagnostics.yamllint.with({
        args = { "-c", vim.fn.expand("~/git/dotfiles/yamllint.yaml"), "--format", "parsable", "-" },
      }),

      -- formatting
      -- null_ls.builtins.formatting.cbfmt,
      null_ls.builtins.formatting.autopep8,
      null_ls.builtins.formatting.trim_whitespace,
      null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.formatting.deno_fmt,
      null_ls.builtins.formatting.beautysh,

      -- Misc
      null_ls.builtins.code_actions.gitsigns,
    },

  })
end

return M
