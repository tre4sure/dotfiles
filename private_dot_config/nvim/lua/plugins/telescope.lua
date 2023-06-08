return {
       'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                                 , branch = '0.1.1',
       dependencies = { 'nvim-lua/plenary.nvim' },
       cmd = "Telescope",
       keys = {
           { '<leader>ff', ':Telescope find_files<CR>', desc = 'find files', },
           { '<leader>fg', ':Telescope live_grep<CR>', desc = 'find words', },
           { '<leader>fb', ':Telescope buffers<CR>', desc = 'find buffers', },
           { '<leader>fh', ':Telescope help_tags<CR>', desc = 'find helps', },
       },
}
