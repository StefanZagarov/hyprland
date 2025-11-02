-- Theme Persistence Module
-- Saves and loads the last used colorscheme/theme

local M = {}

-- Path to the theme save file
local theme_file = vim.fn.stdpath("data") .. "/last_theme.txt"

-- Save the current theme to file
function M.save_theme(theme_name)
	local file = io.open(theme_file, "w")
	if file then
		file:write(theme_name)
		file:close()
	end
end

-- Load the last saved theme (returns theme name string or nil if none exists)
function M.load_last_theme()
	local file = io.open(theme_file, "r")
	if file then
		local theme = file:read("*all")
		file:close()
		return theme
	end
	return nil -- no saved theme
end

-- Set up global functions for easy access
function M.setup()
	_G.save_theme = M.save_theme
	_G.load_last_theme = M.load_last_theme
end

return M

