return {
	-- Register TRANSPARENT Kanagawa Dragon
	setup = function()
		require("kanagawa").setup({
			compile = false,
			transparent = true,
			theme = "dragon", -- dragon theme
			hide_statusline = false,
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

					-- Floats
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },

					-- WinBar (if used)
					WinBar = { bg = "NONE" },
					WinBarNC = { bg = "NONE" },

					-- StatusLine (optional)
					StatusLine = { bg = "NONE" },
					StatusLineNC = { bg = "NONE" },

					-- GitSigns transparency
					GitSignsAdd = { bg = "NONE" },
					GitSignsChange = { bg = "NONE" },
					GitSignsDelete = { bg = "NONE" },
					GitSignsTopDelete = { bg = "NONE" },
					GitSignsChangeDelete = { bg = "NONE" },
					GitSignsUntracked = { bg = "NONE" },

					-- Noice transparency
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
					["@lsp.mod.readonly"] = { fg = "#908bb0" }, -- const variables
					["@lsp.typemod.variable.readonly"] = { fg = "#908bb0" }, -- const variables

					-- 🔹 BASE COLOR FOR ALL VARIABLES (including let declarations)
					["@lsp.type.variable"] = { fg = "#A6A69C" }, -- Base color for all variables (used for let variables)

					-- Function parameters
					["@lsp.type.parameter"] = { fg = "#8EA4A2" },
					["@lsp.typemod.parameter.declaration"] = { fg = "#8EA4A2" },

					-- Function name
					["@lsp.type.function"] = { fg = "#B6927B" },
					["@lsp.typemod.function.declaration"] = { fg = "#B6927B" },

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

					-- 🔹 FIX BORDERS AND UI ELEMENTS (same as above)
					WinSeparator = { bg = "NONE", fg = "#545c7e" },
					VertSplit = { bg = "NONE", fg = "#545c7e" },
					Pmenu = { bg = "NONE", fg = "#c0caf5" },
					PmenuSel = { bg = "#414868", fg = "#c0caf5" },
					PmenuSbar = { bg = "NONE" },
					PmenuThumb = { bg = "#545c7e" },
					TabLine = { bg = "NONE", fg = "#545c7e" },
					TabLineSel = { bg = "NONE", fg = "#c0caf5" },
					TabLineFill = { bg = "NONE" },
					TermCursor = { bg = "#ff9e64", fg = "#1f1f28" },
					TermCursorNC = { bg = "#545c7e", fg = "#1f1f28" },
					WildMenu = { bg = "NONE", fg = "#bb9af7" },
					DiagnosticFloatBorder = { bg = "NONE", fg = "#545c7e" },
					LspFloatWinBorder = { bg = "NONE", fg = "#545c7e" },
					LspInfoBorder = { bg = "NONE", fg = "#545c7e" },
					TelescopeBorder = { bg = "NONE", fg = "#545c7e" },
					TelescopePromptBorder = { bg = "NONE", fg = "#545c7e" },
					TelescopeResultsBorder = { bg = "NONE", fg = "#545c7e" },
					TelescopePreviewBorder = { bg = "NONE", fg = "#545c7e" },
				}
			end,
		})
		vim.cmd.colorscheme("kanagawa-dragon")
		vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
		vim.cmd("hi FoldColumn guibg=NONE ctermbg=NONE")
	end,
}
