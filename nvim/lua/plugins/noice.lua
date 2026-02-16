return {
	"folke/noice.nvim",
	event = "VeryLazy", -- Load after startup for better performance
	keys = {
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "[N]oice [H]istory",
		},
		{
			"<leader>nm",
			function()
				require("noice").cmd("last")
			end,
			desc = "[N]oice Last [M]essage",
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim", -- Required UI component library
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			-- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				-- ["cmp.entry.get_documentation"] = true, -- unneeded since i am using blink.cmp, and not not nvim-cmp
			},
		},
		-- Routes control which messages go to which views
		routes = {
			{
				-- Filter for file write messages (like "5L, 120B written")
				filter = {
					event = "msg_show", -- Event type: "msg_show" | "msg_showmode" | "msg_showcmd"
					any = {
						{ find = "%d+L, %d+B" }, -- Pattern matching for save messages
						{ find = "; after #%d+" }, -- Undo messages
						{ find = "; before #%d+" }, -- Redo messages
					},
				},
				view = "mini", -- Send these messages to the mini view (our styled notification)
				-- Alternative views: "notify" | "split" | "vsplit" | "popup"
			},
		},
		presets = {
			-- Use a classic bottom search instead of floating
			-- true = classic bottom, false = floating cmdline
			bottom_search = false,
			-- Position the cmdline and popupmenu together (like VSCode command palette)
			-- true = together at top, false = separate
			command_palette = true,
			-- Long messages will be sent to a split instead of wrapping
			-- true = split for long messages, false = wrap in place
			long_message_to_split = true,
			-- Enables an input dialog for inc-rename.nvim (if you have it installed)
			inc_rename = false,
			-- Add borders to LSP documentation hover windows
			-- true = bordered, false = borderless
			lsp_doc_border = true,
		},
		-- cmdline = {enabled = false},
		views = {
			mini = {
				-- Backend determines rendering engine
				-- "mini" = compact notification style
				-- Alternative: "popup" for larger styled windows
				backend = "mini",
				-- What the position is relative to
				-- "editor" = whole editor window (what we want for fixed position)
				-- "win" = current window, "cursor" = cursor position
				relative = "editor",
				-- Alignment of message text
				-- "message-right" = align text to right side of notification
				-- Alternatives: "message-left" | "message-center"
				align = "message-right",
				-- How long notification stays visible (milliseconds)
				-- 2000 = 2 seconds. Set to false to keep visible until dismissed
				timeout = 5000,
				-- Reverse = true means newest messages on top (stack upward)
				-- false = newest messages on bottom (stack downward)
				reverse = true,
				position = {
					-- Row position: positive = from top, negative = from bottom
					-- 2 = 2 lines from top
					-- Try: 1 (very top), 5 (lower), -2 (near bottom)
					row = 2,
					-- Column position: "100%" = far right edge
					-- Try: "50%" (center), "0%" (left), 80 (80 chars from left)
					col = "95%",
				},
				size = {
					-- Width of notification box
					-- "auto" = fit content width automatically
					-- Try: 40 (fixed 40 chars), "50%" (half screen), "auto"
					width = "auto",
					-- Height of notification box
					-- "auto" = fit content height automatically
					-- Try: 5 (fixed 5 lines), "auto"
					height = "auto",
					-- Maximum height in lines before scrolling
					-- 15 = max 15 lines tall
					max_height = 15,
					-- Maximum width in characters before wrapping
					-- 80 = max 80 characters wide
					-- Note: Must be a number, not percentage
					max_width = 80,
				},
				border = {
					-- Border style around notification
					-- "rounded" = smooth rounded corners (├─┐│┘─└│)
					-- Alternatives: "single" | "double" | "shadow" | "none" | "solid"
					style = "rounded",
				},
				win_options = {
					-- Window transparency (0 = opaque, 100 = fully transparent)
					-- 50 = 50% transparent (semi-transparent)
					-- Try: 0 (solid), 30 (slightly see-through), 70 (very transparent)
					winblend = 30,
					-- Map highlight groups for this window
					-- Format: "OriginalGroup:YourCustomGroup,AnotherOriginal:AnotherCustom"
					-- Normal = background, FloatBorder = border color
					winhighlight = "Normal:NoiceMini,FloatBorder:NoiceMiniBorder",
				},
			},
		},
	},
}
