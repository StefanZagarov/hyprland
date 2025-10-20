return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  config = function()
    require("persistence").setup()
    vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })
    vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
    -- Save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function() require("persistence").save() end
})
  end,
}