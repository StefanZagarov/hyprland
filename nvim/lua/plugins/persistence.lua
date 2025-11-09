return {
	"folke/persistence.nvim",
	cond = false,
	event = "VimEnter",
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Restore session",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore last session",
		},
	},
	opts = {},
	config = function()
		require("persistence").setup()
		-- Save session on exit
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				require("persistence").save()
			end,
		})
	end,
}

