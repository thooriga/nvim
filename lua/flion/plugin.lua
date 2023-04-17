local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/which-key.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    {
        "windwp/nvim-autopairs",
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "windwp/nvim-ts-autotag"
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "mbbill/undotree"
    },
    {
        "theprimeagen/harpoon"
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim"
    }
})

