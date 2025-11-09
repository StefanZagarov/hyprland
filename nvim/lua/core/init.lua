-- Core module loader
local M = {}

function M.setup()
	-- Load core components
	require("core.options")()
	require("core.keymap")()
	require("core.autocomds")()

	-- Load theme persistence
	require("scripts.theme-persistence").setup()

	-- Load saved theme AFTER all plugins and themes are ready
	vim.schedule(function()
		local last_theme = load_last_theme()
		if last_theme then
			-- Load saved theme (safely, will fail gracefully if command doesn't exist)
			pcall(vim.cmd, last_theme)
		else
			-- No saved theme, default to TokyoNight
			vim.cmd("TokyoNight")
		end
	end)
end

return M
