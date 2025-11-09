local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Color themes (:Telescope themes - to view themes (custom script), :Telescope colorscheme - to view all themes (built-in, no transparent support))
-- Theme switching:
--   :Telescope themes        → pick visually
--   :TokyoNight              → solid background
--   :TokyoNightTransparent   → native transparency
--   :Kanagawa                → solid background
--   :KanagawaTransparent     → native transparency
--   :KanagawaDragon          → solid background
--   :KanagawaDragonTransparent → native transparency

local themes = {
	{ name = "TokyoNight", cmd = "TokyoNight" },
	{ name = "TokyoNight (Transparent)", cmd = "TokyoNightTransparent" },
	{ name = "Kanagawa", cmd = "Kanagawa" },
	{ name = "Kanagawa (Transparent)", cmd = "KanagawaTransparent" },
	{ name = "Kanagawa Dragon", cmd = "KanagawaDragon" },
	{ name = "Kanagawa Dragon (Transparent)", cmd = "KanagawaDragonTransparent" },
}

local function theme_picker(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Themes",
			finder = finders.new_table({
				results = themes,
				entry_maker = function(entry)
					return {
						value = entry.cmd,
						display = entry.name,
						ordinal = entry.name,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd(selection.value)
				end)
				return true
			end,
		})
		:find()
end

return require("telescope").register_extension({
	exports = {
		themes = theme_picker,
	},
})
