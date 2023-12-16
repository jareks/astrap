vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.wo.wrap = false -- set nowrap

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true -- needed to highlight current line number
vim.opt.signcolumn = "number" -- display sign without line number if there's a diagnostic info for line

vim.opt.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.cmd.colorscheme('OceanicNext')
-- darker backgrounds than in original Oceanic Next
vim.cmd[[highlight Normal guibg=#080c0f]]
vim.cmd[[highlight EndOfBuffer guibg=#05080a]]
vim.cmd[[highlight CursorLineNr guifg=#aaaaaa]]

vim.g.mapleader = "\\"
vim.keymap.set('n', ';', ':')

-- Copy to system clipboard
vim.keymap.set('', '<leader>c', '"+y')
-- Paste from system clipboard
vim.keymap.set('', '<leader>v', '"+p')

-- backspace hides search highlights
vim.keymap.set('n', '<BS>', ':nohlsearch<CR>', { silent = true })

-- Replace word under coursor
vim.keymap.set('', '<leader>s', '"ayiw:%s/<C-R>a/')

-- ctrl-s saves file
vim.keymap.set('n', '<C-s>', '<ESC>:w<CR>', { silent = true })
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>', { silent = true })

-- Needs to be set *before* camelcasemotion plugin is loaded
-- ,w jumps one camel-case word
vim.g.camelcasemotion_key=','


-----
-- NVim plugins with Packer
--
require('packer').startup(
	function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		use 'mhartington/oceanic-next'

		use {
		  'nvim-telescope/telescope.nvim',
		  requires = { {'nvim-lua/plenary.nvim'} }
		}
    use({
        "kelly-lin/telescope-ag",
        requires = { "nvim-telescope/telescope.nvim" },
    })

		use {
		    'nvim-treesitter/nvim-treesitter',
		    run = ':TSUpdate'
		}

    use 'mbbill/undotree'
    use 'bkad/camelcasemotion'
    use 'tpope/vim-commentary'   -- use 'gc' to comment

    -- LSP without lsp-zero or mason. All lsp servers needs to be installed and configured manually
    use 'neovim/nvim-lspconfig'

    use {
      'L3MON4D3/LuaSnip',
      requires = { "rafamadriz/friendly-snippets" } -- friendly-snippets contains snippets for various programming langueges
    }
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'saadparwaiz1/cmp_luasnip',  -- display luasnip suggestions inside nvim-cmp
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
      }
    }
    use 'hrsh7th/cmp-nvim-lsp'


    use {
      "folke/which-key.nvim",
      -- Marks: ` or ' buffer local and global marks
      -- Registers: " (NORMAL mode) <C-R> (INSERT mode) buffer local and global registers when you hit 
      -- Presets: Built-in key binding help for motions, text-objects, operators, windows, nav, z and g 
      -- Spelling: When enabled, this plugin hooks into z= and replaces the full-screen spelling suggestions window by a list of suggestions within WhichKey.
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({})
      end
    }

    -- Autoomatically insert closing bracket, based on treesitter
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
    -- TODO: consider integration with nvim-cmp: https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
    --

    -- autoclose html <tags> using treesitter. Supports renaming too.
    use 'windwp/nvim-ts-autotag'
	end
)



