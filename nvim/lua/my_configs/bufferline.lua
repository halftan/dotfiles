local M = {}
M.setup = function()
  -- Barbar
  -- require('bufferline').setup {
  --   icons = 'both',
  --   icon_pinned = '車',
  -- }
  --
  -- -- for nvim-tree
  -- local nvim_tree_events = require('nvim-tree.events')
  -- local bufferline_api = require('bufferline.api')
  --
  -- local function get_tree_size()
  --   return require'nvim-tree.view'.View.width
  -- end
  --
  -- nvim_tree_events.subscribe('TreeOpen', function()
  --   bufferline_api.set_offset(get_tree_size())
  -- end)
  --
  -- nvim_tree_events.subscribe('Resize', function()
  --   bufferline_api.set_offset(get_tree_size())
  -- end)
  --
  -- nvim_tree_events.subscribe('TreeClose', function()
  --   bufferline_api.set_offset(0)
  -- end)

  require('bufferline').setup{
    options = {
      numbers = "ordinal",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
          return ''
        end
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or "" )
          s = s .. n .. sym
        end
        return s
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        }
      },
      custom_areas = {
        right = function()
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
          local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
          local info = #vim.diagnostic.get(0, {severity = seve.INFO})
          local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

          if error ~= 0 then
            table.insert(result, {text = " E " .. error, fg = "#EC5241"})
          end

          if warning ~= 0 then
            table.insert(result, {text = " W " .. warning, fg = "#EFB839"})
          end

          if hint ~= 0 then
            table.insert(result, {text = " H " .. hint, fg = "#A3BA5E"})
          end

          if info ~= 0 then
            table.insert(result, {text = " i " .. info, fg = "#7EA9A7"})
          end
          return result
        end,
      }
    }
  }
end
return M
