local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	--packer 
	use 'wbthomason/packer.nvim'
    	--mason
    	use { "williamboman/mason.nvim" }
    	use "williamboman/mason-lspconfig.nvim"
	--colorscheme
	use 'EdenEast/nightfox.nvim'
	--devicons
	use 'kyazdani42/nvim-web-devicons'
	--Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
    --barbar
	-- use {
	-- 	'romgrk/barbar.nvim',
	-- 	requires = {'kyazdani42/nvim-web-devicons'}
	-- }
	--bufferline
	use {
	"akinsho/bufferline.nvim", 
	requires = {'kyazdani42/nvim-web-devicons'}
	}

	--nvim-tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
	--Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	--ToggleTerm
	use {
		"akinsho/toggleterm.nvim", tag = '*'
	}
	--lspconfig
	use 'neovim/nvim-lspconfig' 
	--tree-sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
	--coq--------------------------
	use {
		'ms-jpq/coq_nvim', branch = 'coq'
	}

	use {
		'ms-jpq/coq.artifacts', branch = 'artifacts'
	}
	use {
		'ms-jpq/coq.thirdparty', branch = '3p'
	}
	-------------------------
    --debug
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    --Comment
	use {
		'numToStr/Comment.nvim'
	}
    --line-guides
    use "lukas-reineke/indent-blankline.nvim"

	--auto-pairs
	use {
		'jiangmiao/auto-pairs'
	}
    --surround
    use {
        "kylechui/nvim-surround",
        tag = "*"
    }

    --auto-save
	use{
	"Pocco81/auto-save.nvim"
	}
        --Markdown preview
    	use "davidgranstrom/nvim-markdown-preview"
    	if packer_bootstrap then
    		require('packer').sync()
	end

end)
