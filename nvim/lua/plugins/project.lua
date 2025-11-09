return {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "[S]earch [P]rojects" },
    },
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern", "lsp" },
            patterns = { ".git", "package.json", "Cargo.toml" },
        })
        require('telescope').load_extension('projects')
    end,
}