local opt = vim.opt
local g = vim.g

opt.number = true
-- opt.numberwidth = 2
opt.relativenumber = true

opt.clipboard = "unnamedplus"
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.ruler = false

opt.termguicolors = true

g.mapleader = " "


-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- copy to windows clip
-- if vim.fn.has('wsl') then
--  vim.cmd [[
--  augroup Yank
--  autocmd!
--  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
--  augroup END
--  ]]
-- end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.cmd.colorscheme "catppuccin-macchiato"

require("keymap")

