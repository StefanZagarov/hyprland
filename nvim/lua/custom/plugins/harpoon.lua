return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- Keymaps
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[H]arpoon [A]dd file" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon toggle menu" })

		-- Quick navigation
		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end, { desc = "[H]arpoon file [1]" })
		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end, { desc = "[H]arpoon file [2]" })
		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end, { desc = "[H]arpoon file [3]" })
		vim.keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end, { desc = "[H]arpoon file [4]" })
		vim.keymap.set("n", "<leader>h5", function()
			harpoon:list():select(5)
		end, { desc = "[H]arpoon file [5]" })
		vim.keymap.set("n", "<leader>h6", function()
			harpoon:list():select(6)
		end, { desc = "[H]arpoon file [6]" })
		vim.keymap.set("n", "<leader>h7", function()
			harpoon:list():select(7)
		end, { desc = "[H]arpoon file [7]" })
		vim.keymap.set("n", "<leader>h8", function()
			harpoon:list():select(8)
		end, { desc = "[H]arpoon file [8]" })
		vim.keymap.set("n", "<leader>h9", function()
			harpoon:list():select(9)
		end, { desc = "[H]arpoon file [9]" })

		-- Navigate through harpoon list
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "[H]arpoon [N]ext" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "[H]arpoon [P]revious" })
	end,
}

