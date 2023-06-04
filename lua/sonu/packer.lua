vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer!
	use 'wbthomason/packer.nvim'

	-- Themes
	use {
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'gruvbox'
		end,
	}

	-- Harpoon
	use('theprimeagen/harpoon')

	-- Undo Tree
	use('mbbill/undotree')

	-- Git related plugins
	use('tpope/vim-fugitive')
	use('tpope/vim-rhubarb')

	-- Commentary
	use('tpope/vim-commentary')

	-- Smooth Scroll
	use('karb94/neoscroll.nvim')

	-- Autopair
	use { 'windwp/nvim-autopairs', opts = {} }

	-- Detect tabstop and shiftwidth automatically
	use('tpope/vim-sleuth')


	-- Fuzzy Finder (files, lsp, etc)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'onedark',
				component_separators = '|',
				section_separators = '',
			},
		},
	}

	use {
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = '┊',
			show_trailing_blankline_indent = false,
		},
	}

	use {
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	}

	-- Useful plugin to show you pending keybinds.
	use { 'folke/which-key.nvim', opts = {} }

	-- Useful status updates for LSP
	use { 'j-hui/fidget.nvim', opts = {} }

	-- Additional lua configuration, makes nvim stuff amazing!
	use { 'folke/neodev.nvim' }

	-- "gc" to comment visual regions/lines
	use { 'numToStr/Comment.nvim', opts = {} }

	use {
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '[c', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = 'Go to Previous Hunk' })
				vim.keymap.set('n', ']c', require('gitsigns').next_hunk,
					{ buffer = bufnr, desc = 'Go to Next Hunk' })
				vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		}
	}


	-- LSP Zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },

			-- Rust Analyzer
			{ 'simrat39/rust-tools.nvim' },
		}

	}
end)
