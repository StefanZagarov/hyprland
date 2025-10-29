return {
	"SmiteshP/nvim-navic",
	cond = true, -- true: enabled, false: disabled
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		separator = " > ",
		highlight = true, -- enables syntax highlighting of symbols
		click = false, -- enable mouse click to jump to symbol (rarely used)
		depth_limit = 0, -- 0 = no limit; set to e.g. 5 to truncate deep paths
		depth_limit_indicator = "..", -- shown when depth is limited
		icons = {
			File = "󰈙 ",
			Module = " ",
			Namespace = "󰌗 ",
			Package = "󰏗 ",
			Class = "󰌗 ",
			Method = "󰆧 ",
			Property = " ",
			Field = " ",
			Constructor = " ",
			Enum = " ",
			Interface = " ",
			Function = "󰊕 ",
			Variable = "󰫧 ",
			Constant = "󰏿 ",
			String = "󰉿 ",
			Number = "󰎠 ",
			Boolean = "◩ ",
			Array = "󰅪 ",
			Object = "󰅩 ",
			Key = "󰌋 ",
			Null = "󰟢 ",
			EnumMember = " ",
			Struct = "󰙅 ",
			Event = " ",
			Operator = "󰆕 ",
			TypeParameter = "󰊄 ",
		},
	},
	init = function()
		-- Set up global navic LSP attach hook
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("NavicAttach", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, args.buf)
				end
			end,
		})

		-- Show navic's breadcrumbs in the winbar
		vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
}

