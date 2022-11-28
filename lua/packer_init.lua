-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
  ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)
	local p = function(name)
		return string.format("require'config.plugins.%s'", name)
	end
	-- Add you plugins here:
	use("wbthomason/packer.nvim") -- packer can manage itself

	-- File explorer
	-- use 'kyazdani42/nvim-tree.lua'

	-- Indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- Autopair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Tag viewer
	use("preservim/tagbar")

	-- Treesitter interface
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Color schemes
	use("navarasu/onedark.nvim")
	use("tanvirtin/monokai.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" })
  use({
      "norcalli/nvim-colorizer.lua",
      config = function ()
        require("colorizer").setup()
      end
    })

  -- LSP
  use("neovim/nvim-lspconfig")

  -- Autocomplete
  -- use {'neoclide/coc.nvim', branch = 'release'}
  use({
      "hrsh7th/nvim-cmp",
      requires = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        { "hrsh7th/cmp-calc", module = "cmp_calc" },
        { "hrsh7th/cmp-emoji", module = "cmp_emoji" },
        { "quangnguyen30192/cmp-nvim-ultisnips", module = "cmp_nvim_ultisnips" },
        {
          "tzachar/cmp-tabnine",
          run = "./install.sh",
          requires = "hrsh7th/nvim-cmp",
          module = "cmp_tabnine",
        },
        { "honza/vim-snippets", opt = true },
        {
          "SirVer/ultisnips",
          opt = true,
          wants = "vim-snippets",
        },
      },
    })

  -- Statusline
  use({
      "feline-nvim/feline.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })

  -- tpope stuff
  use("tpope/vim-abolish")
  use("tpope/vim-dispatch")
  use("radenling/vim-dispatch-neovim")
  use("tpope/vim-eunuch")
  use("tpope/vim-fugitive")
  use("tpope/vim-obsession")
  use("tpope/vim-repeat")
    use("tpope/vim-rhubarb")
    use("tpope/vim-sensible")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("tpope/vim-vinegar")

    --telescope
    local telescope_ext = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "cljoly/telescope-repo.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "benfowler/telescope-luasnip.nvim",
      "stevearc/aerial.nvim",
    }
    -- if vim.fn.has "win32" == 1 then
      --   table.insert(telescope_ext, "davidgranstrom/telescope-scdoc.nvim")
    -- end
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = telescope_ext })

    -- snippets
    use("SirVer/ultisnips")
    use("honza/vim-snippets")

    -- frontend plugins
    use("csscomb/vim-csscomb")
    use("galooshi/vim-import-js")
    use("ruanyl/vim-fixmyjs")
    use("styled-components/vim-styled-components")

    -- others
    use("justinmk/vim-sneak")
    use("airblade/vim-gitgutter")
    use("sheerun/vim-polyglot")
    use("rcarriga/nvim-notify")
    use("nathanaelkane/vim-indent-guides")
    use({ "wesleimp/stylua.nvim" })
    use({ "folke/which-key.nvim" })
    use({
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end,
      })
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    -- git labels
    use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({})
		end,
	})

	-- Dashboard (start screen)
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

use ( { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } )

use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}




	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end

end)
