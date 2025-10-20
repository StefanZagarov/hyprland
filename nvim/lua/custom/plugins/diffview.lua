return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>GD", "<cmd>DiffviewOpen<CR>", desc = "[G]it [D]iffview" },
    { "<leader>Gd", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
  },
}