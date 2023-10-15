return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      -- "vim", -- vim should always be installed but not in mine
      -- "vimdoc",
      "query",
      -- go stuff
      "go",
      "gomod",
      "gowork",
      "gosum",

      "python",
      "json",
      "jsonc",

      -- web stuff
      "html",
      "css",
      "javascript",
    },
  },
}
