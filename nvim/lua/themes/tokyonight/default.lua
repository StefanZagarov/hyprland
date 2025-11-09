return {
	setup = function()
		-- Register default TokyoNight
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			style = "night",
			transparent = false, -- explicit
			styles = {
				comments = { italic = false },
			},
		})
		vim.cmd.colorscheme("tokyonight")
		-- Remove color from folded lines's background
		vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
		vim.cmd("hi FoldColumn guibg=NONE ctermbg=NONE")
	end,
}
