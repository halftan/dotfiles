local M = {}

M.conf_dir = vim.fn.stdpath('config')

function M.file_in_conf_dir(filename)
  if filename == nil then filename = '' end
  return string.format('%s/%s', M.conf_dir, filename)
end

function M.load_all_in_path(path)
  require'plenary.scandir'.scan_dir_async(path, {
    respect_gitignore = true,
    search_pattern = function(entry)
      if entry:find('init.lua') ~= nil then
        return false
      end
      if entry:match('^.+%.lua$') ~= nil then
        return true
      end
    end,
    on_insert = function(entry)
      local name = entry:match(M.file_in_conf_dir('lua') .. '/(.+).lua$'):gsub('/', '.')
      pcall(require, name)
    end
  })
end

return M
