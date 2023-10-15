return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  -- opts = function(_, opts)
  --   opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
  --     file_ignore_patterns = { "^vendor/" },
  --   })
  -- end,
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      file_ignore_patterns = { "^vendor/" },
    },
  },
}
