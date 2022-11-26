--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- set node version
vim.g.coc_node_path = '/Users/nickprokesch/.nvm/versions/node/v16.16.0/bin/node'

-- Import Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
-- require('core/colors')
require('core/statusline')
require('lsp/lspconfig')
-- require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')
require('plugins/catppuccin')
require('plugins/notify')
require('plugins/whichkey')
require('plugins/telescope')
require('plugins/aerial')