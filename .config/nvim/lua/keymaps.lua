-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map('n', '<leader>n', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Move Buffers
map('n', 'gn', ':bn<CR>')
map('n', 'gp', ':bp<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<C-s>', ':w<CR>')

-- Keeping text selected after indenting
map('x', '>', '>gv')
map('x', '<', '<gv')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>tf', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>tn', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.find_files, {})
vim.keymap.set('n', '<leader>b', telescope.buffers, {})
vim.keymap.set('n', '<leader>g', telescope.live_grep, {})

-- Comment
require('Comment').setup({
  ignore = '^$',
  toggler = {
      line = '<leader>c',
  },
  opleader = {
      line = '<leader>c',
  },
})


-- LSP shortcuts

-- Displays hover information about the symbol under the cursor
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- Jump to the definition
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
-- Jump to declaration
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
-- Lists all the implementations for the symbol under the cursor
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
-- Jumps to the definition of the type symbol
map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
-- Lists all the references
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
-- Displays a function's signature information
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
-- Renames all references to the symbol under the cursor
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- Selects a code action available at the current cursor position
map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
-- Show diagnostics in a floating window
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

