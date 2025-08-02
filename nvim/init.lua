-- Options

-- General
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.cursorline = false     -- Highlight the current line
vim.opt.wrap = false           -- Wrap lines
vim.opt.scrolloff = 5          -- Keep N lines above and below the cursor

-- Indentation
vim.opt.tabstop = 2            -- Tab width
vim.opt.shiftwidth = 2         -- Indentation
vim.opt.softtabstop = 2        -- Number of spaces to use for a tab
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart auto-indenting
vim.opt.autoindent = true      -- Copy indent from current line when starting a new line

-- Search
vim.opt.ignorecase = true      -- Case insensitive search
vim.opt.smartcase = true       -- Case sensitive search if there is an uppercase letter
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Incremental search

-- Visual
vim.opt.termguicolors = true   -- Enable true color support (24-bit colors)
vim.opt.signcolumn = "yes"     -- Show sign column (for line numbers, etc.)
vim.opt.colorcolumn = ""    -- Show a vertical column at N characters (empty string for no columns)
vim.opt.showmatch = true       -- Highlight matching brackets
vim.opt.matchtime = 2          -- How long to highlight matching brackets
vim.opt.cmdheight = 1          -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false       -- Don't show the mode (e.g. INSERT, NORMAL, etc.) (we hide it because we will create our own custom statusline)
vim.opt.pumheight = 10         -- Popup menu height
vim.opt.pumblend = 10          -- Popup menu transparency
vim.opt.winblend = 0           -- Floating window transparency
vim.opt.conceallevel = 0       -- Hide * characters in markdown files
vim.opt.concealcursor = ""     -- Don't conceal cursor in insert mode
vim.opt.lazyredraw = true      -- Don't redraw while executing macros (for performance)
vim.opt.synmaxcol = 300        -- Limit syntax highlighting (for performance)

-- Behavior
-- Behavior settings
-- vim.opt.hidden = true                              -- Allow hidden buffers
-- vim.opt.errorbells = false                         -- No error bells
-- vim.opt.backspace = "indent,eol,start"             -- Better backspace behavior
-- vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.iskeyword:append("-")                         -- Treat dash as part of word
-- vim.opt.path:append("**")                          -- include subdirectories in search
-- vim.opt.selection = "exclusive"                    -- Selection behavior
-- vim.opt.mouse = "a"                                -- Enable mouse support
-- vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
-- vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                         -- Set encoding

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- Theme
vim.cmd.colorscheme("default")                         -- uses the default Vim colorscheme
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })      -- makes main editing background transparent
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })    -- makes background of inactive windows transparent
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- makes background at end of buffer transparent

-- 2. Load keymaps (we'll create this later)
-- require("keymaps")

-- 3. Load plugins (we'll do this step-by-step)
-- require("plugins")

-- 4. Load custom settings (optional later)
-- require("settings")

