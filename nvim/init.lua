local HOME = os.getenv("HOME")
---@class table
local g = vim.g
---@class table
local opt = vim.opt
g.mapleader = '\\'
g.python3_host_prog = HOME .. "/.pyenv/versions/neovim/bin/python"
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

g.completion_engine = 'nvim_cmp' -- Available options: coq, nvim_cmp
g.ansible_template_syntaxes = {['*\\.ya?ml\\.j2'] = 'yaml'}

opt.mouse = 'nv'
opt.termguicolors = true
opt.background = 'dark'
opt.virtualedit = 'block,onemore' -- Allow for cursor beyond last character
opt.updatetime = 200
opt.undofile = true
opt.undolevels = 1000
opt.hidden = true
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize'
opt.smarttab = true
opt.modeline = true
opt.list = true -- Show these tabs and spaces and so on
opt.listchars = 'tab:▸ ,extends:❯,precedes:❮,trail:·' -- Change listchars
opt.linebreak = true -- Wrap long lines at a blank
opt.showbreak = '↪'  -- Change wrap line break
opt.nrformats = 'bin,hex,unsigned'
opt.previewheight = 6
opt.formatoptions:append('r')
opt.conceallevel = 2
opt.sw = 4
opt.ts = 4
opt.sts = 4
opt.et = true
opt.shiftround = true
opt.history = 1000
opt.tabpagemax = 50

local function mapcheck(lhs, mode)
  local maps = vim.api.nvim_get_keymap(mode)
  for _, map in ipairs(maps) do
    if map.lhs == lhs then
      return true
    end
  end
  return false
end

if not mapcheck('<C-U>', 'i') then
  vim.api.nvim_set_keymap('i', '<C-U>', '<C-G>u<C-U>', { noremap = true, silent = true })
end

if not mapcheck('<C-W>', 'i') then
  vim.api.nvim_set_keymap('i', '<C-W>', '<C-G>u<C-W>', { noremap = true, silent = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.cmd("normal! g'\"zz")
    end
  end,
})

-- Session settings
g.session_default_overwrite = true
g.session_autoload = 'no'
g.session_autosave = 'no'

-- AutoPairs setting
g.AutoPairsMapCh = false

-- vim-sneak settings
-- g['sneak#s_next'] = 1
-- g['sneak#use_ic_scs'] = 1

-- camelcasemotion setting
g.camelcasemotion_key = ','

-- vim-fugitive setting
g.github_enterprise_urls = { '***REMOVED***' }

-- editorconfig settings
g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)
require("lazy").setup("my_plugins")

vim.cmd.colorscheme('catppuccin-macchiato')
require 'my_keymaps'
