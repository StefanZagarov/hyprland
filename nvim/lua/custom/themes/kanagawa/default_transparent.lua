return {
	-- Register TRANSPARENT Kanagawa
	setup = function()
		require("kanagawa").setup({
			compile = false,
			transparent = true, -- native transparency
			hide_statusline = false, -- keep statusline visible (optional)
			overrides = function()
				return {
					Comment = { italic = false },

					Normal = { bg = "NONE" },
					SignColumnSB = { bg = "NONE" },

					-- Sign column (Git signs gutter)
					SignColumn = { bg = "NONE" },
					CursorLineSign = { bg = "NONE" },
					LineNr = { bg = "NONE" },
					CursorLineNr = { bg = "NONE" },

					-- -- Floats
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },

					-- -- WinBar (if used)
					WinBar = { bg = "NONE" },
					WinBarNC = { bg = "NONE" },

					-- -- StatusLine (optional)
					StatusLine = { bg = "NONE" },
					StatusLineNC = { bg = "NONE" },

					-- GitSigns transparency (this fixes the gutter transparency!)
					GitSignsAdd = { bg = "NONE" },
					GitSignsChange = { bg = "NONE" },
					GitSignsDelete = { bg = "NONE" },
					GitSignsTopDelete = { bg = "NONE" },
					GitSignsChangeDelete = { bg = "NONE" },
					GitSignsUntracked = { bg = "NONE" },

					-- Noice transparency (command line, popups, notifications)
					NoiceMini = { bg = "NONE" },
					NoiceMiniBorder = { bg = "NONE" },
					NoiceCmdline = { bg = "NONE" },
					NoiceCmdlinePopup = { bg = "NONE" },
					NoiceCmdlinePopupBorder = { bg = "NONE" },
					NoiceCmdlineIcon = { bg = "NONE" },
					NoicePopupmenu = { bg = "NONE" },
					NoicePopupmenuBorder = { bg = "NONE" },
					NoiceConfirm = { bg = "NONE" },
					NoiceConfirmBorder = { bg = "NONE" },

					-- 🔹 Swapped Kanagawa Colors
					-- Constants/readonly variables
					["@lsp.mod.readonly"] = { fg = "#7E9CD8" }, -- const variables
					["@lsp.typemod.variable.readonly"] = { fg = "#7E9CD8" }, -- const variables

					-- 🔹 BASE COLOR FOR ALL VARIABLES (including let declarations)
					["@lsp.type.variable"] = { fg = "#B8B4D0" }, -- Base color for all variables

					-- Function parameters
					["@lsp.type.parameter"] = { fg = "#7FB4CA" },
					["@lsp.typemod.parameter.declaration"] = { fg = "#7FB4CA" },

					-- Function name
					["@lsp.type.function"] = { fg = "#FFA066" },
					["@lsp.typemod.function.declaration"] = { fg = "#FFA066" },

					-- Boolean
					["Boolean"] = { fg = "#7e9cd8" },

					-- 🔹 BASE TREESITTER SYNTAX HIGHLIGHTING (fallback)
					["@variable"] = { fg = "#7E9CD8" }, -- TreeSitter variable highlighting, this catches ALL variables in syntax trees (object properties, local vars, etc.)
					["@variable.builtin"] = { fg = "#7FB4CA" }, -- Built-in variables like `this`, `self`

					-- Parameters (fallback for non-LSP files) - orange
					["@parameter"] = { fg = "#7FB4CA" }, -- Function parameters in syntax trees
					["@parameter.builtin"] = { fg = "#7FB4CA" }, -- Built-in parameters

					-- Numbers
					javaScriptNumber = { fg = "#ff5d62" }, -- Orange (Kanagawa's default number color)
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
