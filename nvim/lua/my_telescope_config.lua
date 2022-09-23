local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"
local lga_actions = require "telescope-live-grep-args.actions"

return {
  setup = function()
    local ts = require("telescope")

    local theme_conf = {
      commands = {theme = 'dropdown'},
      builtin = {theme = 'dropdown'},
    }

    for k, v in pairs(require "telescope.builtin") do
      if theme_conf[k] == nil then
        theme_conf[k] = {
          theme = 'ivy'
        }
      end
    end

    for ext, funcs in pairs(require("telescope").extensions) do
      theme_conf[ext] = {
        theme = 'ivy'
      }
    end

    local pickers_conf = {}

    for ext, conf in pairs(theme_conf) do
      if pickers_conf[ext] ~= nil then
        pickers_conf[ext]['theme'] = conf['theme']
      else
        pickers_conf[ext] = conf
      end
    end

    ts.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-i>'] = actions_layout.toggle_preview,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-S-J>'] = actions.results_scrolling_down,
            ['<C-S-K>'] = actions.results_scrolling_up,
          },
        },
      },
      pickers = pickers_conf,
      extensions = {
        live_grep_args = {
          default_mappings = {
            i = {
              ['<C-S-K>'] = lga_actions.quote_prompt(),
            }
          }
        }
      }
    }

    ts.load_extension "live_grep_args"
    ts.load_extension 'projects'
    ts.load_extension 'fzf'
    ts.load_extension "packer"
  end
}
