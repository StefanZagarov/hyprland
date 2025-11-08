return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		vim.api.nvim_create_user_command("TokyoNight", function()
			require("custom.themes.tokyonight.default").setup()
			save_theme("TokyoNight")
		end, {})

		vim.api.nvim_create_user_command("TokyoNightTransparent", function()
			require("custom.themes.tokyonight.default_transparent").setup()
			save_theme("TokyoNightTransparent")
		end, {})
	end,
}
