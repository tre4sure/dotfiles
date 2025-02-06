-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- run in vscode
if vim.g.vscode then
  local vscode = require("vscode-neovim")
  local function vscode_action(cmd)
    return function()
      vscode.action(cmd)
    end
  end

  vim.keymap.del("n", "<c-/>")
  vim.keymap.set({ "n", "v" }, "<Leader>cf", function()
    vscode.action("editor.action.formatDocument")
    vscode.action("workbench.action.files.save")
  end, { desc = "Format" })

  vim.keymap.set("n", "<leader>cr", vscode_action("editor.action.rename"), { desc = "Rename" })
  vim.keymap.set("n", "<leader>ff", vscode_action("workbench.action.quickOpen"), { desc = "Quick Open" })
  vim.keymap.set("n", "]d", vscode_action("editor.action.marker.next"), { desc = "Next Diagnostic" })
  vim.keymap.set("n", "[d", vscode_action("editor.action.marker.prev"), { desc = "Prev Diagnostic" })

  vim.keymap.set(
    "n",
    "<leader>bb",
    vscode_action("workbench.action.quickOpenPreviousRecentlyUsedEditor"),
    { desc = "Switch to Other Buffer" }
  )
  vim.keymap.set(
    "n",
    "<leader>bd",
    vscode_action("workbench.action.closeActiveEditor"),
    { desc = "Close Active Editor" }
  )
end
