return {
	-- Register Kanagawa Dragon
	setup = function()
		require("kanagawa").setup({
			compile = false,
			transparent = false,
			theme = "dragon", -- dragon theme
			overrides = function()
				return {
					Comment = { italic = false },
					-- Match gutter to background
					SignColumn = { bg = "NONE" },
					LineNr = { bg = "NONE" },
					CursorLineNr = { bg = "NONE" },
					-- GitSigns gutter symbols
					GitSignsAdd = { bg = "NONE" },
					GitSignsChange = { bg = "NONE" },
					GitSignsDelete = { bg = "NONE" },

					FloatBorder = { fg = "#54546D", bg = "#181616" }, -- CRITICAL: set BOTH fg AND bg

					-- Original colors:
					-- const variable  ORANGE - #B6927B
					-- let variable DIRTY WHITE - #C5C9C5
					-- function BLUE - #908bb0
					-- method LIGHT BLUE - #8EA4A2
					-- function property GRAY - #A6A69C
					-- number RED - #8EA4A2

					-- 🔹 Swapped Kanagawa Colors
					-- Constants/readonly variables
					["@lsp.mod.readonly"] = { fg = "#908bb0" }, -- const variables
					["@lsp.typemod.variable.readonly"] = { fg = "#908bb0" }, -- const variables

					-- 🔹 BASE COLOR FOR ALL VARIABLES (including let declarations)
					["@lsp.type.variable"] = { fg = "#A6A69C" }, -- Base color for all variables (used for let variables)

					-- Function parameters
					["@lsp.type.parameter"] = { fg = "#8EA4A2" },
					["@lsp.typemod.parameter.declaration"] = { fg = "#8EA4A2" },

					-- Function name (IMPORTANT: These override readonly for functions!)
					["@lsp.type.function"] = { fg = "#B6927B" },
					["@lsp.typemod.function.declaration"] = { fg = "#B6927B" },
					["@lsp.typemod.function.readonly"] = { fg = "#B6927B" }, -- const functions = orange!
					["@lsp.typemod.function.local"] = { fg = "#B6927B" }, -- local functions = orange!

					-- Boolean
					["Boolean"] = { fg = "#908bb0" },

					-- 🔹 BASE TREESITTER SYNTAX HIGHLIGHTING (fallback)
					["@variable"] = { fg = "#908bb0" }, -- TreeSitter variable highlighting, this catches ALL variables in syntax trees (object properties, local vars, etc.)
					["@variable.builtin"] = { fg = "#8EA4A2" }, -- Built-in variables like `this`, `self`

					-- Parameters (fallback for non-LSP files) - orange
					["@parameter"] = { fg = "#8EA4A2" }, -- Function parameters in syntax trees
					["@parameter.builtin"] = { fg = "#8EA4A2" }, -- Built-in parameters

					-- Numbers
					javaScriptNumber = { fg = "#B6927B" }, -- Orange (Kanagawa's default number color)
					Number = { fg = "#8EA4A2" }, -- Base number group

					-- If you want Treesitter/LSP fallbacks too:
					["@number"] = { fg = "#8EA4A2" }, -- Treesitter numbers
					["@lsp.type.number"] = { fg = "#8EA4A2" }, -- LSP semantic tokens

					-- Diagnostic styling
					DiagnosticSignError = { bg = "NONE" },
					DiagnosticSignWarn = { bg = "NONE" },
					DiagnosticSignInfo = { bg = "NONE" },
					DiagnosticSignHint = { bg = "NONE" },
				}
			end,
		})
		vim.cmd.colorscheme("kanagawa-dragon")
		vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
		vim.cmd("hi FoldColumn guibg=NONE ctermbg=NONE")
	end,
}
