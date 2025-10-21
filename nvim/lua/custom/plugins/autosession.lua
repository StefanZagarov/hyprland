return {
    'rmagatti/auto-session',
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
            auto_session_enable_last_session = false,
            auto_save_enabled = true,
            auto_restore_enabled = true,
        })
    end,
}