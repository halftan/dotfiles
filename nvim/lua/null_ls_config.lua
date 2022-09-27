local M = {}

M.setup = function()
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      -- Shell
      -- null_ls.builtins.code_actions.shellcheck,
      -- null_ls.builtins.diagnostics.shellcheck,

      -- Lua
      null_ls.builtins.diagnostics.selene,

      -- Python
      null_ls.builtins.formatting.autopep8,
      null_ls.builtins.diagnostics.flake8,

      -- Ansible
      null_ls.builtins.diagnostics.ansiblelint,

      -- Misc
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.diagnostics.trail_space,
      null_ls.builtins.formatting.trim_whitespace,
    },

  })
end

return M
