return {
  {
    'nvim-telescope/telescope.nvim', version = '0.2.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local builtin = require('telescope.builtin')

      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({})
          },
        },
      })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')

      -- Basic Keymaps
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers,   { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope help tags' })
    end,
  },
}

