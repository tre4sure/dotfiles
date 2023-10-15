-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h7" -- text below applies for VimScript

  -- Define a function to increase font size
  function IncreaseFontSize()
    local currentSize = tonumber(vim.fn.split(vim.o.guifont, ":")[2]:sub(2))
    vim.o.guifont = string.format("JetBrainsMono Nerd Font:h%d", currentSize + 1)
  end

  -- Define a function to decrease font size
  function DecreaseFontSize()
    local currentSize = tonumber(vim.fn.split(vim.o.guifont, ":")[2]:sub(2))
    if currentSize > 1 then
      vim.o.guifont = string.format("JetBrainsMono Nerd Font:h%d", currentSize - 1)
    end
  end

  -- Map keys for font size adjustment
  vim.api.nvim_set_keymap("n", "<C-=>", ":lua IncreaseFontSize()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua DecreaseFontSize()<CR>", { noremap = true, silent = true })
end
