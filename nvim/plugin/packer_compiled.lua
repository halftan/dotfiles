-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/halftan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/halftan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/halftan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/halftan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/halftan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/ale",
    url = "https://github.com/w0rp/ale"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/ansible-vim",
    url = "https://github.com/pearofducks/ansible-vim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26my_configs.bufferline\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\2d\0\0\2\0\5\0\r6\0\0\0009\0\1\0009\0\2\0)\1\0\0B\0\2\2:\0\2\0)\1\1\0\1\1\0\0X\0\2€'\0\3\0X\1\1€'\0\4\0L\0\2\0\n<esc>\v<esc>l\24nvim_win_get_cursor\bapi\bvim¦\1\1\0\3\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0016\2\6\0009\2\a\0029\2\b\2=\2\t\0013\2\n\0=\2\v\1B\0\2\1K\0\1\0\tkeys\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\22clear_empty_lines\1\1\3\0\0\ajk\ajj\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\2U\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  indentLine = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lua-dev.nvim"] = {
    config = { "\27LJ\2\2w\0\2\a\0\6\0\17\18\3\0\0009\2\0\0'\4\1\0)\5\1\0+\6\2\0B\2\5\2\n\2\0\0X\2\b€+\2\2\0=\2\2\1+\2\2\0=\2\3\1+\2\2\0=\2\4\1+\2\2\0=\2\5\1K\0\1\0\fplugins\ntypes\fruntime\fenabled\rdotfiles\tfindN\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\roverride\1\0\0\0\nsetup\flua-dev\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2‡\1\0\0\4\0\a\0\r6\0\0\0006\1\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3&\2\3\2B\0\3\3\15\0\0\0X\2\2€9\2\6\1B\2\1\1K\0\1\0\20autopairs_setup\22completion_engine\6g\bvim\26my_completion_engine.\frequire\npcall\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\2¨\1\0\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\2\0\0006\3\0\0009\3\1\0039\3\4\3\18\4\0\0B\3\2\0A\1\1\2*\2\0\0\1\2\1\0X\2\2€4\2\0\0L\2\2\0004\2\3\0>\0\1\2L\2\2\0\24nvim_buf_line_count\24nvim_buf_get_offset\25nvim_get_current_buf\bapi\bvim€€€\2Ð\1\0\0\a\0\b\2!6\0\0\0006\1\1\0009\1\2\0019\1\3\1)\2\0\0B\1\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\3\0\0\23\4\1\0\18\5\0\0+\6\2\0B\2\5\2:\2\1\2\18\3\2\0009\2\5\2\18\4\1\0\18\5\1\0B\2\4\2\18\3\2\0009\2\6\2'\4\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\5À\tbody\15lsp_expand]\0\1\3\1\3\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6€-\1\0\0009\1\1\0019\1\2\1)\2üÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\16scroll_docs\fmapping\fvisible]\0\1\3\1\3\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6€-\1\0\0009\1\1\0019\1\2\1)\2\4\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\16scroll_docs\fmapping\fvisibleR\0\1\2\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleR\0\1\2\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\fvisibleÅ\1\0\1\2\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\5À\4À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\2ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\2ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\5À\tjump\rjumpable\21select_prev_item\fvisible—\1\0\1\3\0\b\0\f6\1\0\0'\2\1\0B\1\2\0029\1\2\0016\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\1\0\2=\1\a\0L\0\2\0\17capabilities\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire§\r\1\0\15\0Y\0Í\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\3\0'\1\4\0B\0\2\0026\1\3\0'\2\5\0B\1\2\0025\2\6\0005\3\b\0003\4\a\0=\4\t\3>\3\1\0024\3\3\0004\4\3\0005\5\n\0>\5\1\0045\5\v\0>\5\2\4>\4\1\0034\4\3\0>\2\1\0045\5\f\0005\6\r\0=\6\14\5>\5\2\4>\4\2\0033\4\15\0006\5\3\0'\6\16\0B\5\2\0029\6\17\0005\a\19\0005\b\18\0=\b\20\a5\b\22\0003\t\21\0=\t\23\b=\b\24\a5\b\28\0009\t\25\0009\t\26\t9\t\27\tB\t\1\2=\t\29\b9\t\25\0009\t\26\t9\t\27\tB\t\1\2=\t\30\b=\b\26\a9\b\31\0009\b \b9\b!\b5\t#\0003\n\"\0=\n$\t3\n%\0=\n&\t3\n'\0=\n(\t3\n)\0=\n*\t9\n\31\0009\n+\nB\n\1\2=\n,\t9\n\31\0009\n-\nB\n\1\2=\n.\t9\n\31\0009\n/\n5\v0\0B\n\2\2=\n1\t9\n\31\0003\v2\0005\f3\0B\n\3\2=\n4\t9\n\31\0003\v5\0005\f6\0B\n\3\2=\n7\t9\n\31\0009\n+\n5\v;\0005\f9\0004\r\3\0005\0148\0>\14\1\r=\r:\f=\f\25\vB\n\2\2=\n<\tB\b\2\2=\b\31\a9\b\25\0009\b:\b6\t=\0\18\n\3\0B\t\2\0A\b\0\2=\b:\a5\bB\0009\t>\0015\n?\0005\v@\0=\vA\nB\t\2\2=\tC\b=\bD\aB\6\2\0019\6\17\0009\6E\6'\aF\0005\bG\0009\t\25\0009\t:\t4\n\3\0>\2\1\nB\t\2\2=\t:\bB\6\3\0019\6\17\0009\6E\0065\aH\0005\bJ\0009\t\25\0009\t:\t6\n=\0\18\v\3\0B\n\2\0024\v\3\0005\fI\0>\f\1\vB\t\3\2=\t:\bB\6\3\0019\6\17\0009\6E\6'\aK\0005\bM\0009\t\25\0009\t:\t6\n=\0\18\v\3\0B\n\2\0024\v\3\0005\fL\0>\f\1\vB\t\3\2=\t:\bB\6\3\0019\6\17\0009\6N\6'\aO\0005\bP\0009\t\31\0009\t \t9\tN\tB\t\1\2=\t\31\b4\t\3\0>\2\1\t=\t:\bB\6\3\0019\6\17\0009\6N\6'\aQ\0005\bR\0009\t\31\0009\t \t9\tN\tB\t\1\2=\t\31\b9\t\25\0009\t:\t4\n\3\0005\vS\0>\v\1\n4\v\3\0005\fT\0>\f\1\vB\t\3\2=\t:\bB\6\3\0013\6U\0006\a\3\0'\bV\0B\a\2\0029\a\17\a\18\b\6\0B\a\2\0016\a\3\0'\bW\0B\a\2\0029\aX\aB\a\1\0012\0\0€K\0\1\0\14lazy_load luasnip.loaders.from_vscode\18my_lsp_config\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\forgmode\borg\1\0\0\1\0\1\tname\26vim-dadbod-completion\1\4\0\0\bsql\nmysql\nplsql\1\0\0\14gitcommit\rfiletype\15formatting\vformat\1\0\0\tmenu\1\0\a\fcmdline\n[cmd]\forgmode\n[org]\rnvim_lsp\t[Î»]\vbuffer\n[buf]\fluasnip\v[SNIP]\26vim-dadbod-completion\t[DB]\tpath\v[path]\1\0\2\rmaxwidth\3<\tmode\16symbol_text\15cmp_format\vunpack\n<C-s>\1\0\0\fsources\1\0\0\1\0\1\tname\fluasnip\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-k>\0\n<C-j>\0\n<C-d>\0\n<C-u>\1\0\0\0\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\vexpand\1\0\0\0\rmatching\1\0\0\1\0\1\31disallow_prefix_unmatching\2\nsetup\fluasnip\0\23trigger_characters\1\3\0\0\6.\6/\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\15get_bufnrs\1\0\0\0\1\0\2\19max_item_count\3\n\tname\vbuffer\flspkind\bcmp\frequire*set completeopt=menu,menuone,noselect\bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad", "LuaRun" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2Õ\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\1B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\24update_focused_file\1\0\2\16update_root\2\venable\2\1\0\2\23sync_root_with_cwd\2\20respect_buf_cwd\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "orgmode" },
    config = { "\27LJ\2\2B\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25my_treesitter_config\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\2;\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  orgmode = {
    config = { "\27LJ\2\2š\3\0\0\3\0\v\0\0186\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\1\1\0B\0\2\0029\0\3\0005\1\5\0005\2\4\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\1B\0\2\1K\0\1\0\27org_todo_keyword_faces\1\0\2\tNEXTG:background #61C6F2 :foreground #EC6238 :weight bold :slant italic\tHOLD::background #FFFFFF :foreground #F64E59 :underline on\22org_todo_keywords\1\a\0\0\tTODO\tNEXT\tHOLD\6|\tDONE\rARCHIVED\21org_agenda_files\1\0\1\27org_default_notes_file\24~/my-orgs/notes.org\1\2\0\0\19~/my-orgs/**/*\nsetup\21setup_ts_grammar\forgmode\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  sniprun = {
    commands = { "SnipRun", "SnipInfo" },
    config = { "\27LJ\2\2[\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\fdisplay\1\0\0\1\2\0\0\15NvimNotify\nsetup\fsniprun\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2A\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24my_telescope_config\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18my_statusline\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-dadbod"] = {
    after = { "vim-dadbod-ui" },
    commands = { "DB" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    load_after = {
      ["vim-dadbod"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-hexokinase"] = {
    commands = { "HexokinaseToggle", "HexokinaseTurnOn", "HexokinaseTurnOff" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/vim-hexokinase",
    url = "https://github.com/rrethy/vim-hexokinase"
  },
  ["vim-matchup"] = {
    after_files = { "/home/halftan/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-numbertoggle",
    url = "https://github.com/jeffkreeftmeijer/vim-numbertoggle"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-session"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-session",
    url = "https://github.com/xolox/vim-session"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-textobj-indent",
    url = "https://github.com/kana/vim-textobj-indent"
  },
  ["vim-textobj-underscore"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-textobj-underscore",
    url = "https://github.com/lucapette/vim-textobj-underscore"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\2À\1\0\0\4\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\14operators\1\0\2\agb\18BlockComments\agc\rComments\vwindow\1\0\1\vborder\vsingle\fplugins\1\0\0\rspelling\1\0\0\1\0\1\fenabled\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/halftan/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\2U\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2B\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25my_treesitter_config\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lua-dev.nvim
time([[Config for lua-dev.nvim]], true)
try_loadstring("\27LJ\2\2w\0\2\a\0\6\0\17\18\3\0\0009\2\0\0'\4\1\0)\5\1\0+\6\2\0B\2\5\2\n\2\0\0X\2\b€+\2\2\0=\2\2\1+\2\2\0=\2\3\1+\2\2\0=\2\4\1+\2\2\0=\2\5\1K\0\1\0\fplugins\ntypes\fruntime\fenabled\rdotfiles\tfindN\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\roverride\1\0\0\0\nsetup\flua-dev\frequire\0", "config", "lua-dev.nvim")
time([[Config for lua-dev.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26my_configs.bufferline\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\2À\1\0\0\4\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\14operators\1\0\2\agb\18BlockComments\agc\rComments\vwindow\1\0\1\vborder\vsingle\fplugins\1\0\0\rspelling\1\0\0\1\0\1\fenabled\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2A\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24my_telescope_config\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2Õ\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\1B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\24update_focused_file\1\0\2\16update_root\2\venable\2\1\0\2\23sync_root_with_cwd\2\20respect_buf_cwd\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18my_statusline\frequire\0", "config", "vim-airline")
time([[Config for vim-airline]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\2;\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2‡\1\0\0\4\0\a\0\r6\0\0\0006\1\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3&\2\3\2B\0\3\3\15\0\0\0X\2\2€9\2\6\1B\2\1\1K\0\1\0\20autopairs_setup\22completion_engine\6g\bvim\26my_completion_engine.\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\2d\0\0\2\0\5\0\r6\0\0\0009\0\1\0009\0\2\0)\1\0\0B\0\2\2:\0\2\0)\1\1\0\1\1\0\0X\0\2€'\0\3\0X\1\1€'\0\4\0L\0\2\0\n<esc>\v<esc>l\24nvim_win_get_cursor\bapi\bvim¦\1\1\0\3\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0016\2\6\0009\2\a\0029\2\b\2=\2\t\0013\2\n\0=\2\v\1B\0\2\1K\0\1\0\tkeys\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\22clear_empty_lines\1\1\3\0\0\ajk\ajj\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-notify ]]
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\2¨\1\0\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\2\0\0006\3\0\0009\3\1\0039\3\4\3\18\4\0\0B\3\2\0A\1\1\2*\2\0\0\1\2\1\0X\2\2€4\2\0\0L\2\2\0004\2\3\0>\0\1\2L\2\2\0\24nvim_buf_line_count\24nvim_buf_get_offset\25nvim_get_current_buf\bapi\bvim€€€\2Ð\1\0\0\a\0\b\2!6\0\0\0006\1\1\0009\1\2\0019\1\3\1)\2\0\0B\1\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\3\0\0\23\4\1\0\18\5\0\0+\6\2\0B\2\5\2:\2\1\2\18\3\2\0009\2\5\2\18\4\1\0\18\5\1\0B\2\4\2\18\3\2\0009\2\6\2'\4\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\5À\tbody\15lsp_expand]\0\1\3\1\3\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6€-\1\0\0009\1\1\0019\1\2\1)\2üÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\16scroll_docs\fmapping\fvisible]\0\1\3\1\3\0\14-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6€-\1\0\0009\1\1\0019\1\2\1)\2\4\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\16scroll_docs\fmapping\fvisibleR\0\1\2\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleR\0\1\2\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\fvisibleÅ\1\0\1\2\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\5À\4À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\2ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\2ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\5À\tjump\rjumpable\21select_prev_item\fvisible—\1\0\1\3\0\b\0\f6\1\0\0'\2\1\0B\1\2\0029\1\2\0016\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\1\0\2=\1\a\0L\0\2\0\17capabilities\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire§\r\1\0\15\0Y\0Í\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\3\0'\1\4\0B\0\2\0026\1\3\0'\2\5\0B\1\2\0025\2\6\0005\3\b\0003\4\a\0=\4\t\3>\3\1\0024\3\3\0004\4\3\0005\5\n\0>\5\1\0045\5\v\0>\5\2\4>\4\1\0034\4\3\0>\2\1\0045\5\f\0005\6\r\0=\6\14\5>\5\2\4>\4\2\0033\4\15\0006\5\3\0'\6\16\0B\5\2\0029\6\17\0005\a\19\0005\b\18\0=\b\20\a5\b\22\0003\t\21\0=\t\23\b=\b\24\a5\b\28\0009\t\25\0009\t\26\t9\t\27\tB\t\1\2=\t\29\b9\t\25\0009\t\26\t9\t\27\tB\t\1\2=\t\30\b=\b\26\a9\b\31\0009\b \b9\b!\b5\t#\0003\n\"\0=\n$\t3\n%\0=\n&\t3\n'\0=\n(\t3\n)\0=\n*\t9\n\31\0009\n+\nB\n\1\2=\n,\t9\n\31\0009\n-\nB\n\1\2=\n.\t9\n\31\0009\n/\n5\v0\0B\n\2\2=\n1\t9\n\31\0003\v2\0005\f3\0B\n\3\2=\n4\t9\n\31\0003\v5\0005\f6\0B\n\3\2=\n7\t9\n\31\0009\n+\n5\v;\0005\f9\0004\r\3\0005\0148\0>\14\1\r=\r:\f=\f\25\vB\n\2\2=\n<\tB\b\2\2=\b\31\a9\b\25\0009\b:\b6\t=\0\18\n\3\0B\t\2\0A\b\0\2=\b:\a5\bB\0009\t>\0015\n?\0005\v@\0=\vA\nB\t\2\2=\tC\b=\bD\aB\6\2\0019\6\17\0009\6E\6'\aF\0005\bG\0009\t\25\0009\t:\t4\n\3\0>\2\1\nB\t\2\2=\t:\bB\6\3\0019\6\17\0009\6E\0065\aH\0005\bJ\0009\t\25\0009\t:\t6\n=\0\18\v\3\0B\n\2\0024\v\3\0005\fI\0>\f\1\vB\t\3\2=\t:\bB\6\3\0019\6\17\0009\6E\6'\aK\0005\bM\0009\t\25\0009\t:\t6\n=\0\18\v\3\0B\n\2\0024\v\3\0005\fL\0>\f\1\vB\t\3\2=\t:\bB\6\3\0019\6\17\0009\6N\6'\aO\0005\bP\0009\t\31\0009\t \t9\tN\tB\t\1\2=\t\31\b4\t\3\0>\2\1\t=\t:\bB\6\3\0019\6\17\0009\6N\6'\aQ\0005\bR\0009\t\31\0009\t \t9\tN\tB\t\1\2=\t\31\b9\t\25\0009\t:\t4\n\3\0005\vS\0>\v\1\n4\v\3\0005\fT\0>\f\1\vB\t\3\2=\t:\bB\6\3\0013\6U\0006\a\3\0'\bV\0B\a\2\0029\a\17\a\18\b\6\0B\a\2\0016\a\3\0'\bW\0B\a\2\0029\aX\aB\a\1\0012\0\0€K\0\1\0\14lazy_load luasnip.loaders.from_vscode\18my_lsp_config\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\forgmode\borg\1\0\0\1\0\1\tname\26vim-dadbod-completion\1\4\0\0\bsql\nmysql\nplsql\1\0\0\14gitcommit\rfiletype\15formatting\vformat\1\0\0\tmenu\1\0\a\fcmdline\n[cmd]\forgmode\n[org]\rnvim_lsp\t[Î»]\vbuffer\n[buf]\fluasnip\v[SNIP]\26vim-dadbod-completion\t[DB]\tpath\v[path]\1\0\2\rmaxwidth\3<\tmode\16symbol_text\15cmp_format\vunpack\n<C-s>\1\0\0\fsources\1\0\0\1\0\1\tname\fluasnip\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-k>\0\n<C-j>\0\n<C-d>\0\n<C-u>\1\0\0\0\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\vexpand\1\0\0\0\rmatching\1\0\0\1\0\1\31disallow_prefix_unmatching\2\nsetup\fluasnip\0\23trigger_characters\1\3\0\0\6.\6/\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\15get_bufnrs\1\0\0\0\1\0\2\19max_item_count\3\n\tname\vbuffer\flspkind\bcmp\frequire*set completeopt=menu,menuone,noselect\bcmd\bvim\0", "config", "nvim-cmp")

vim.cmd [[ packadd orgmode ]]

-- Config for: orgmode
try_loadstring("\27LJ\2\2š\3\0\0\3\0\v\0\0186\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\1\1\0B\0\2\0029\0\3\0005\1\5\0005\2\4\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\1B\0\2\1K\0\1\0\27org_todo_keyword_faces\1\0\2\tNEXTG:background #61C6F2 :foreground #EC6238 :weight bold :slant italic\tHOLD::background #FFFFFF :foreground #F64E59 :underline on\22org_todo_keywords\1\a\0\0\tTODO\tNEXT\tHOLD\6|\tDONE\rARCHIVED\21org_agenda_files\1\0\1\27org_default_notes_file\24~/my-orgs/notes.org\1\2\0\0\19~/my-orgs/**/*\nsetup\21setup_ts_grammar\forgmode\frequire\0", "config", "orgmode")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DB lua require("packer.load")({'vim-dadbod'}, { cmd = "DB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIRenameBuffer lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIRenameBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HexokinaseToggle lua require("packer.load")({'vim-hexokinase'}, { cmd = "HexokinaseToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ALEEnable lua require("packer.load")({'ale'}, { cmd = "ALEEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUILastQueryInfo lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUILastQueryInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIFindBuffer lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIFindBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIAddConnection lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIAddConnection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipInfo lua require("packer.load")({'sniprun'}, { cmd = "SnipInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HexokinaseTurnOn lua require("packer.load")({'vim-hexokinase'}, { cmd = "HexokinaseTurnOn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIToggle lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HexokinaseTurnOff lua require("packer.load")({'vim-hexokinase'}, { cmd = "HexokinaseTurnOff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'ale'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'ale'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'ale'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'ale'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'ale'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'ale'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'ale'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'ale'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'ale'}, { ft = "racket" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
