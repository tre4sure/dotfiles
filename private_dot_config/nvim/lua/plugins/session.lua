return {
  {
    "rmagatti/auto-session",
    enabled = false,
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/code", "~/Downloads", "/" },

        auto_save_enabled = true,
        auto_restore_enabled = true,

        -- ⚠️ This will only work if Telescope.nvim is installed
        -- The following are already the default values, no need to provide them if these are already the settings you want.
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      })
    end,
  },
  {
    "Shatur/neovim-session-manager",
    cmd = "SessionManager",
    keys = { { "<leader>sp", "<cmd>SessionManager load_session<cr>", desc = "Symbols Outline" } },
    config = function()
      require("session_manager").setup({
        path_replacer = "_", -- The character to which the path separator will be replaced for session files.
        colon_replacer = "+", -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_dirs = { "/home/treasure" },
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          "gitcommit",
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      })
    end,
  },
}
