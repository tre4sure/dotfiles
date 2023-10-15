return {
  -- 添加注释
  "danymat/neogen",
  keys = {
    {
      "<leader>nc",
      function()
        require("neogen").generate({})
      end,
      desc = "Neogen Comment",
    },
  },
  opts = { snippet_engine = "luasnip" },
}
