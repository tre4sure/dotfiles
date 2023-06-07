return {
       'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                                 , branch = '0.1.1',
       dependencies = { 'nvim-lua/plenary.nvim' },
       cmd = "Telescope",
       keys = {
           {'n', '<leader>ff', ":Telescope find_files<CR>", },
           {'n', '<leader>fg', ":Telescope live_grep<CR>", },
           {'n', '<leader>fb', ":Telescope buffers<CR>", },
           {'n', '<leader>fh', ":Telescope help_tags<CR>", },
       },
}
