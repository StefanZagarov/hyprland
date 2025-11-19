return {
	-- Register default Kanagawa
	setup = function()
		require("kanagawa").setup({
			compile = false, -- disable compilation for faster switching
			transparent = false,
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

					Normal = { bg = "#202020" }, -- Background
					NormalFloat = { bg = "#202020" }, -- Floating window background
					FloatBorder = { fg = "#545464", bg = "#202020" }, -- CRITICAL: set BOTH fg AND bg
					-- Telescope border color consistency
					TelescopeBorder = { fg = "#545464", bg = "#202020" }, -- Match FloatBorder

					-- Original colors:
					-- const variable  ORANGE - #FFA066
					-- let variable DIRTY WHITE - #DCD7BA
					-- function BLUE - #7E9CD8
					-- method LIGHT BLUE - #7FB4CA
					-- function property LIGHT PURPLE - #B8B4D0

					-- 🔹 Swapped Kanagawa Colors
					-- Constants/readonly variables
					["@lsp.mod.readonly"] = { fg = "#7E9CD8" }, -- const variables
					["@lsp.typemod.variable.readonly"] = { fg = "#7E9CD8" }, -- const variables

					-- 🔹 BASE COLOR FOR ALL VARIABLES (including let declarations)
					["@lsp.type.variable"] = { fg = "#B8B4D0" }, -- Base color for all variables

					-- Function parameters
					["@lsp.type.parameter"] = { fg = "#7FB4CA" },
					["@lsp.typemod.parameter.declaration"] = { fg = "#7FB4CA" },

					-- 🔑 FIX: SET BASE FUNCTION COLOR IN THEME
					-- ["@function"] = { fg = "#e09b70" }, -- Base color for ALL functions
					--
					-- Function name
					["@lsp.type.function"] = { fg = "#e09b70" },
					["@lsp.typemod.function.declaration"] = { fg = "#e09b70" },

					-- Boolean
					["Boolean"] = { fg = "#7e9cd8" },

					-- 🔹 BASE TREESITTER SYNTAX HIGHLIGHTING (fallback)
					["@variable"] = { fg = "#7E9CD8" }, -- TreeSitter variable highlighting, this catches ALL variables in syntax trees (object properties, local vars, etc.)
					["@variable.builtin"] = { fg = "#7FB4CA" }, -- Built-in variables like `this`, `self`

					-- Parameters (fallback for non-LSP files) - orange
					["@parameter"] = { fg = "#7FB4CA" }, -- Function parameters in syntax trees
					["@parameter.builtin"] = { fg = "#7FB4CA" }, -- Built-in parameters

					-- Numbers
					javaScriptNumber = { fg = "#ff5d62" },
					Number = { fg = "#ff5d62" }, -- Base number group

					-- If you want Treesitter/LSP fallbacks too:
					["@number"] = { fg = "#ff5d62" }, -- Treesitter numbers
					["@lsp.type.number"] = { fg = "#ff5d62" }, -- LSP semantic tokens

					-- Diagnostic styling
					DiagnosticSignError = { bg = "NONE" },
					DiagnosticSignWarn = { bg = "NONE" },
					DiagnosticSignInfo = { bg = "NONE" },
					DiagnosticSignHint = { bg = "NONE" },
				}
			end,
		})
		vim.cmd.colorscheme("kanagawa")
		vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
		vim.cmd("hi FoldColumn guibg=NONE ctermbg=NONE")
	end,
}
