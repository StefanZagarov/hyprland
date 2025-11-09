return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "[H]arpoon [A]dd file",
		},
		{
			"<leader>hh",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "[H]arpoon toggle menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "[H]arpoon file [1]",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "[H]arpoon file [2]",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "[H]arpoon file [3]",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "[H]arpoon file [4]",
		},
		{
			"<leader>h5",
			function()
				require("harpoon"):list():select(5)
			end,
			desc = "[H]arpoon file [5]",
		},
		{
			"<leader>h6",
			function()
				require("harpoon"):list():select(6)
			end,
			desc = "[H]arpoon file [6]",
		},
		{
			"<leader>h7",
			function()
				require("harpoon"):list():select(7)
			end,
			desc = "[H]arpoon file [7]",
		},
		{
			"<leader>h8",
			function()
				require("harpoon"):list():select(8)
			end,
			desc = "[H]arpoon file [8]",
		},
		{
			"<leader>h9",
			function()
				require("harpoon"):list():select(9)
			end,
			desc = "[H]arpoon file [9]",
		},
		{
			"<leader>hn",
			function()
				require("harpoon"):list():next()
			end,
			desc = "[H]arpoon [N]ext",
		},
		{
			"<leader>hp",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "[H]arpoon [P]revious",
		},
	},
	config = function()
		require("harpoon"):setup()
	end,
}

