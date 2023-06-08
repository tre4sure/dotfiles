return {
  {
    'rmagatti/auto-session', -- 自动保存 session
    config = function()
      local close_nvimtree = function()
            print('before save')
            local api = require('nvim-tree.api')
            api.tree.close()
      end
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "/" },
        auto_save_enable = true,
        auto_restore_enable = true,
        pre_save_cmds = { close_nvimtree } -- 退出前关闭 nvim-tree
      }
    end
  }
}
