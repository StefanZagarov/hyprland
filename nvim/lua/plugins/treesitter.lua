return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash", "c", "diff", "html", "lua", "luadoc",
                "markdown", "markdown_inline", "query", "vim",
                "vimdoc", "javascript", "typescript", "tsx",
                "json", "css", "regex", "vue", "scss", "yaml",
                "python",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = { enable = true, disable = { "ruby" } },
            
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                    },
                    selection_modes = {
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "V",
                    },
                    include_surrounding_whitespace = true,
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@class.outer",
                        ["]}"] = "@function.inner",
                        ["]]"] = "@function.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@class.outer",
                        ["[{"] = "@function.inner",
                        ["[["] = "@function.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = { ["<leader>a"] = "@parameter.inner" },
                    swap_previous = { ["<leader>A"] = "@parameter.inner" },
                },
            },
        },
    },
    
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
        opts = {
            max_lines = 1,
            multiline_threshold = 20,
            separator = "",
            zindex = 20,
        },
    },
    
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",  -- ✅ THIS IS THE FIX
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
    },
}