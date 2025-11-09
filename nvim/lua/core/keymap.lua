return function()
	-- [[ Basic Keymaps ]]
	--  See `:help vim.keymap.set()`

	-- Clear highlights on search when pressing <Esc> in normal mode
	--  See `:help hlsearch`
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
	-- Otherwise, you normally need to press <C-\><C-n>, which
	-- is not what someone will guess without a bit more experience.
	--
	-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
	-- or just use <C-\><C-n> to exit terminal mode (commented out because it's overlapped by the toggleterm plugin, which uses single escape key, which is more convenient)
	-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- TIP: Disable arrow keys in normal mode
	-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
	-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
	-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
	-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

	-- Keybinds to make split navigation easier.
	--  Use CTRL+<hjkl> to switch between windows
	--
	--  See `:help wincmd` for a list of all window commands
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
	vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
	vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
	vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
	vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

	vim.keymap.set("n", "<C-A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
	-- Move current line or visual selection up/down
	vim.keymap.set("n", "<C-A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
	vim.keymap.set("v", "<C-A-j>", ":m '>+1<CR>==", { desc = "Move visual selection down" })
	vim.keymap.set("v", "<C-A-k>", ":m '<-2<CR>==", { desc = "Move visual selection up" })

	-- NOTE: Telescope keymaps have been moved to lua/plugins/telescope.lua

	-- Keymaps for diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

	-- NOTE: Noice keymaps have been moved to lua/plugins/noice.lua

	-- Custom keymaps
	-- Fix paste so cursor lands at end of block
	vim.keymap.set("n", "p", "p`]", { noremap = true, silent = true })
	vim.keymap.set("n", "P", "P`]", { noremap = true, silent = true })
end
