local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    path_display = { "smart" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    sorting_strategy = "descending",
    file_ignore_patterns = {
      "dist/.*",
      "%.git/.*",
      "%.vim/.*",
      "node_modules/.*",
      "%.idea/.*",
      "%.vscode/.*",
      "%.history/.*"
    },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["?"] = actions.which_key
      }
    }
  },
  pickers = {
    find_files = {
      find_command = {
        'fd',
        '--type',
        'file',
        '--type',
        'symlink',
        '--hidden',
        '--exclude',
        '.git',
      }
    }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
