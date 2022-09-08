local M = {}

M.conf_dir = vim.fn.stdpath('config')

function M.file_in_conf_dir(filename)
  return string.format('%s/%s', M.conf_dir, filename)
end

return M
