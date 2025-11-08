return {
	setup = function()
		-- Register TRANSPARENT TokyoNight
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			style = "night",
			transparent = true, -- explicit
			styles = {
				comments = { italic = false },
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				-- WinBar (breadcrumb showing current function) transparency
				hl.WinBar = { bg = "NONE", fg = c.fg_dark }
				hl.WinBarNC = { bg = "NONE", fg = c.fg_gutter }
			end,
		})
		vim.cmd.colorscheme("tokyonight")
		vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
		vim.cmd("hi FoldColumn guibg=NONE ctermbg=NONE")
	end,
}
