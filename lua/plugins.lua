-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'scrooloose/nerdcommenter'

    use({'vladdoster/remember.nvim', config = [[ require('remember') ]] })
 
    -- tokyonight
    use("folke/tokyonight.nvim")

    use({"ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

    
    use("dracula/vim")

    use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
       
    -- tab标签页
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

    -- lualine 底部状态栏
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")


    -- 文件搜索
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

    -- bashboard-vim
    use("glepnir/dashboard-nvim")

    -- telescope project
    use("ahmedkhalf/project.nvim")

    -- nvim-treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })


    -- lspconfig
    -- use({ "neovim/nvim-lspconfig" })
    -- use({ "williamboman/mason.nvim" })
    -- use({ "williamboman/mason-lspconfig.nvim" })

    use("hrsh7th/nvim-cmp")
    -- 补全源
    use("hrsh7th/vim-vsnip")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

    -- Snippet 引擎
     use("L3MON4D3/LuaSnip")
     use("saadparwaiz1/cmp_luasnip")

   config = {
        git = {
            default_url_format = "git@github.com:%s",
         },
    }


end)


