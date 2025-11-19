return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })
		-- require("mini.map").setup()

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']

		local comment_opts = {
			mappings = {
				-- Disable all default mappings
				comment = "",
				comment_line = "",
				comment_visual = "",
				textobject = "",
			},
		}
		if pcall(require, "ts_context_commentstring.internal") then
			comment_opts.options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			}
		end
		require("mini.comment").setup(comment_opts)

		-- Disable Neovim's built-in commenting (available in Neovim 0.10+)
		vim.keymap.del("n", "gcc", { silent = true })
		vim.keymap.del("n", "gc", { silent = true })
		vim.keymap.del("x", "gc", { silent = true })
		vim.keymap.del("o", "gc", { silent = true })

		-- Create Mini.comment API reference
		local MiniComment = require("mini.comment")

		-- gc = instant toggle (normal mode)
		vim.keymap.set("n", "gc", function()
			MiniComment.toggle_lines(vim.fn.line("."), vim.fn.line("."))
		end, { desc = "Toggle comment line", noremap = true, silent = true })

		-- gc = instant toggle (visual mode)
		vim.keymap.set("v", "gc", function()
			local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			MiniComment.toggle_lines(vim.fn.line("'<"), vim.fn.line("'>"))
		end, { desc = "Toggle comment selection", noremap = true, silent = true })

		-- gC = motion-based commenting
		vim.keymap.set("n", "gC", function()
			return MiniComment.operator()
		end, { expr = true, desc = "Comment motion", noremap = true, silent = true })

		-- gC in visual mode = comment selection
		vim.keymap.set("x", "gC", function()
			local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			MiniComment.toggle_lines(vim.fn.line("'<"), vim.fn.line("'>"))
		end, { desc = "Comment selection", noremap = true, silent = true })

		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
