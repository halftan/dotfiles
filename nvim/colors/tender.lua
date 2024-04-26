-- From base16 color schemes
-- https://github.com/chriskempson/base16-schemes-source
-- https://github.com/DanManN/base16-tender-scheme/tree/master
local use_cterm, palette

palette = {
  base00 = '#282828',
  base01 = '#383838',
  base02 = '#484848',
  base03 = '#4c4c4c',
  base04 = '#b8b8b8',
  base05 = '#eeeeee',
  base06 = '#e8e8e8',
  base07 = '#feffff',
  base08 = '#f43753',
  base09 = '#dc9656',
  base0A = '#ffc24b',
  base0B = '#c9d05c',
  base0C = '#73cef4',
  base0D = '#b3deef',
  base0E = '#d3b987',
  base0F = '#a16946',
}

if palette then
  require('mini.base16').setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = 'tender'
end
