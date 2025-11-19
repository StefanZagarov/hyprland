return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",
	build = "cargo build --release", -- Build native fuzzy matcher for better performance
	dependencies = {
		"folke/lazydev.nvim",
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = { preset = "default" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			accept = { auto_brackets = { enabled = true } },
			menu = {
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
				},
			},
			documentation = { auto_show = false },
			ghost_text = { enabled = false },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				snippets = {
					opts = {
						friendly_snippets = true,
						search_paths = { vim.fn.stdpath("config") .. "/snippets" },
					},
				},
			},
		},
		snippets = { preset = "default" },
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" }, -- Use Rust fuzzy matcher for better performance
	},
}
