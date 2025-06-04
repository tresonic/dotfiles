return {
    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- Jump to files fast
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Commenting
    { 'numToStr/Comment.nvim' },
}
