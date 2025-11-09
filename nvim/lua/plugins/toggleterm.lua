return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<C-t>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "[T]erminal [H]orizontal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "[T]erminal [V]ertical" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "[T]erminal [F]loat" },
		{ "<Esc>", [[<C-\><C-n>]], mode = "t", desc = "Exit terminal mode" },
		{ "<leader>t1", "<cmd>1ToggleTerm<cr>", desc = "[T]erminal 1" },
		{ "<leader>t2", "<cmd>2ToggleTerm<cr>", desc = "[T]erminal 2" },
		{ "<leader>t3", "<cmd>3ToggleTerm<cr>", desc = "[T]erminal 3" },
		{ "<leader>t4", "<cmd>4ToggleTerm<cr>", desc = "[T]erminal 4" },
		{ "<leader>t5", "<cmd>5ToggleTerm<cr>", desc = "[T]erminal 5" },
		{ "<leader>t6", "<cmd>6ToggleTerm<cr>", desc = "[T]erminal 6" },
		{ "<leader>t7", "<cmd>7ToggleTerm<cr>", desc = "[T]erminal 7" },
		{ "<leader>t8", "<cmd>8ToggleTerm<cr>", desc = "[T]erminal 8" },
		{ "<leader>t9", "<cmd>9ToggleTerm<cr>", desc = "[T]erminal 9" },
	},
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
	end,
}