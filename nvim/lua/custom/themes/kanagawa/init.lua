return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		vim.api.nvim_create_user_command("Kanagawa", function()
			require("custom.themes.kanagawa.default").setup()
			save_theme("Kanagawa")
		end, {})

		vim.api.nvim_create_user_command("KanagawaTransparent", function()
			require("custom.themes.kanagawa.default_transparent").setup()
			save_theme("KanagawaTransparent")
		end, {})

		vim.api.nvim_create_user_command("KanagawaDragon", function()
			require("custom.themes.kanagawa.dragon").setup()
			save_theme("KanagawaDragon")
		end, {})

		vim.api.nvim_create_user_command("KanagawaDragonTransparent", function()
			require("custom.themes.kanagawa.dragon_transparent").setup()
			save_theme("KanagawaDragonTransparent")
		end, {})
	end,
}
