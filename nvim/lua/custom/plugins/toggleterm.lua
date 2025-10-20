return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- Size of the terminal
			size = function(term)
				if term.direction == "horizontal" then
					return 15 -- 15 lines for horizontal
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4 -- 40% of screen width
				end
			end,
			-- Where terminal opens: 'vertical' | 'horizontal' | 'tab' | 'float'
			direction = "float",
			-- Floating terminal settings
			float_opts = {
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
				width = math.floor(vim.o.columns * 0.8),
				height = math.floor(vim.o.lines * 0.8),
			},
			-- Close terminal window when process exits
			close_on_exit = true,
			-- Start in insert mode
			start_in_insert = true,
		})

		-- Keymaps
		-- Toggle terminal with Ctrl+\
			vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

		-- Open horizontal terminal
		vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "[T]erminal [H]orizontal" })

		-- Open vertical terminal
		vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "[T]erminal [V]ertical" })

		-- Open floating terminal (default)
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "[T]erminal [F]loat" })

		-- Better terminal navigation - use ESC to go to normal mode
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

		-- Create multiple terminals with numbers
		-- <leader>t1, <leader>t2, <leader>t3
		for i = 1, 9 do
			vim.keymap.set(
				"n",
				"<leader>t" .. i,
				"<cmd>" .. i .. "ToggleTerm<CR>",
				{ desc = "[T]erminal " .. i }
			)
		end
	end,
}