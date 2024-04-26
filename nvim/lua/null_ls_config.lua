local M = {}

local function find_previous_yaml_line(row, max_retrospect_lines)
  max_retrospect_lines = max_retrospect_lines or 200
  local start_row = row - 1 - max_retrospect_lines
  if start_row < 0 then start_row = 0 end
  local lines = vim.api.nvim_buf_get_lines(0, start_row, row - 1, false)
  for i = #lines, 1, -1 do
    local line = vim.trim(lines[i])
    if #line > 0 and line:sub(1, 1) ~= '#' then
      return line
    end
  end
  return lines[#lines]
end

-- See https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- for all sources

M.setup = function()
  local null_ls = require('null-ls')
  null_ls.setup({
    on_attach = require'my_lsp_configs'.on_attach_func,
    sources = {
      -- Shell
      -- null_ls.builtins.code_actions.shellcheck,
      -- null_ls.builtins.diagnostics.shellcheck,

      -- Diagnostics
      null_ls.builtins.diagnostics.selene.with {
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      },
      null_ls.builtins.diagnostics.ansiblelint.with {
        args = { "-c", vim.fn.expand("~/git/dotfiles/ansible-lint.yaml"), "-f", "codeclimate", "-q", "--nocolor", "$FILENAME" },
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      },
      -- null_ls.builtins.diagnostics.trail_space,
      null_ls.builtins.diagnostics.yamllint.with {
        args = { "-c", vim.fn.expand("~/git/dotfiles/yamllint.yaml"), "--format", "parsable", "-" },
        filter = function(diagnostic)
          local row = tonumber(diagnostic.row)
          if row == nil then return true end

          -- fix linter error on wrong line number in jinja2 templates
          local line = ""
          if diagnostic.message == "syntax error: could not find expected ':'" then
            -- line = vim.api.nvim_buf_get_lines(0, row - 2, row - 1, false)[1]
            line = find_previous_yaml_line(row)
          else
            line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
          end
          if line == nil then return true end

          return line:match('%{%%') == nil and line:match('%{%-') == nil and line:match('%{%{') == nil
        end,
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      },
      null_ls.builtins.diagnostics.staticcheck,

      -- formatting
      -- null_ls.builtins.formatting.cbfmt,
      null_ls.builtins.formatting.pyink,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt,
      -- null_ls.builtins.formatting.deno_fmt,

      -- Misc
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.impl,
    },

  })
end

return M
