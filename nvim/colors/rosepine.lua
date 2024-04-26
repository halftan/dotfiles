-- From base16 color schemes
-- https://github.com/chriskempson/base16-schemes-source
-- https://github.com/edunfelt/base16-rose-pine-scheme/tree/main
local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
    base00 = '#232136',
    base01 = '#2a273f',
    base02 = '#393552',
    base03 = '#6e6a86',
    base04 = '#908caa',
    base05 = '#e0def4',
    base06 = '#e0def4',
    base07 = '#56526e',
    base08 = '#eb6f92',
    base09 = '#f6c177',
    base0A = '#ea9a97',
    base0B = '#3e8fb0',
    base0C = '#9ccfd8',
    base0D = '#c4a7e7',
    base0E = '#f6c177',
    base0F = '#56526e',

  }
end

if vim.o.background == 'light' then
  palette = {
    base00 = '#faf4ed',
    base01 = '#fffaf3',
    base02 = '#f2e9de',
    base03 = '#9893a5',
    base04 = '#797593',
    base05 = '#575279',
    base06 = '#575279',
    base07 = '#cecacd',
    base08 = '#b4637a',
    base09 = '#ea9d34',
    base0A = '#d7827e',
    base0B = '#286983',
    base0C = '#56949f',
    base0D = '#907aa9',
    base0E = '#ea9d34',
    base0F = '#cecacd',
  }
end

if palette then
  require('mini.base16').setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = 'rosepine'
end
