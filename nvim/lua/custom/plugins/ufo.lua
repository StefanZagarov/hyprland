return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "VeryLazy",
	config = function()
		-- 🔑 REQUIRED: Set global fold options BEFORE setup
		vim.o.foldcolumn = "0" -- or "1" if you want a fold column
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local suffix = (" ⋯ %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = math.max(0, width - sufWidth)
			local curWidth = 0
			local newVirtText = {}
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "Comment" }) -- Fold info color
			return newVirtText
		end

		-- Setup ufo with ONLY LSP provider (no fallback = no noise)
		require("ufo").setup({
			provider_selector = function()
				return { "lsp" } -- ✅ Only LSP — avoids all fallback exceptions
			end,
			close_fold_kinds_for_ft = {
				default = { "imports", "comment" },
			},
			open_fold_hl_timeout = 400,
			fold_virt_text_handler = fold_virt_text_handler,
			preview = {
				win_config = {
					border = "rounded",
					winhighlight = "Normal:Folded",
					winblend = 10,
					maxheight = 20,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
					close = "q",
					switch = "<Tab>",
					trace = "<CR>",
				},
			},
		})

		-- Remove folded line background highlight
		vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
		vim.cmd("hi FoldColumn guibg=NONE ctermbg=NONE")

		-- Keymaps (all start with 'z' as requested)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = "Folding: " .. desc })
		end

		map("zR", require("ufo").openAllFolds, "Open all folds")
		map("zM", require("ufo").closeAllFolds, "Close all folds")
		map("zr", require("ufo").openFoldsExceptKinds, "Open folds except auto-closed kinds")
		map("zm", function()
			require("ufo").closeFoldsWith(0)
		end, "Close all folds (respect foldlevel)")
		map("zP", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, "Peek fold or show LSP hover")
	end,
}
