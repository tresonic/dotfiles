return {
  -- Colorscheme:
  -- The colorscheme should be available when starting Neovim.
  {
    'navarasu/onedark.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      require('onedark').setup {
        -- styles: dark, darker, cool, deep, warm, warmer, light
        style = 'darker',
        -- colors = { fg = '#b2bbcc' }, --default: #a0a8b7
      }
      require('onedark').load()
    end
  },

  -- Icons
  { 'kyazdani42/nvim-web-devicons', lazy = true },

  -- Git labels
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('gitsigns').setup{}
    end
  },

  -- File explorer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {

    }
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ' '},
        section_separators = { left = '', right = ' '},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = false,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'branch', 'diff', 'diagnostics'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      -- A list of parser names, or "all"
      -- See: `TSInstallInfo` commmand
      ensure_installed = {
        'awk', 'bash', 'c', 'cmake', 'cpp', 'css', 'html', 'javascript', 'json',
        'lua', 'python', 'rust', 'typescript', 'vim', 'yaml', 'vimdoc', 'luadoc', 'markdown', 'zig',
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
      },
    }
  },
}
