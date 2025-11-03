return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      
      window = {
        position = "float",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
         mappings = {
      ["<C-b>"] = "close_window", -- allow toggle-to-close from inside
      ["q"] = "close_window",     -- ensure 'q' uses proper close
    },
      },
      
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {},
          hide_by_pattern = {},
          never_show = {},
        },
      },
      
      -- Floating window specific settings
      float = {
        enabled = true,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 80,
          height = 30,
          row = 5,
          col = 10,
          style = "minimal",
        },
      },
      
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          with_expanders = true,
          expander_collapsed = "▸",
          expander_expanded = "▾",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "󰉋",
          folder_open = "󰝰",
          folder_empty = "󰉖",
          folder_empty_open = "󰷏",
          default = "󰈙",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "✱",
            deleted   = "✖",
            renamed   = "➜",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "⚠",
          }
        },
      },
    })
    
    -- Keymaps
    -- Float (opens at current file's directory)
    vim.keymap.set('n', '<C-b>', ':Neotree reveal float<CR>', { silent = true, desc = "Toggle Neo-tree float" })
    -- Sidebar
    vim.keymap.set('n', '<leader>b', ':Neotree toggle left<CR>', { desc = "Toggle Neo-tree sidebar" })
  end
}
