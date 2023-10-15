return {
  -- code ai
  "huggingface/hfcc.nvim",
  enabled = false,
  opts = {
    api_token = "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",
    model = "bigcode/starcoder",
    query_params = {
      max_new_tokens = 200,
    },
  },
  init = function()
    vim.api.nvim_create_user_command("StarCoder", function()
      require("hfcc.completion").complete()
    end, {})
  end,
}
