return {
    { "vimwiki/vimwiki", },
    {
        "tpope/vim-fugitive",
        cmd = "Git",
    },
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },
    --{ "elihunter173/dirbuf.nvim" },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    { "nvim-tree/nvim-web-devicons", opts = {}, },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        --init = function()
        --    print("FIXME:RD running init() for fzf-lua...")
        --end,
        config = function()
            fzf_lua = require("fzf-lua")
            --print("FIXME:RD running config() for fzf-lua...")
            fzf_lua.setup({
                winopts = {
                    backdrop = 75,
                    height = 0.85,
                    width = 0.7,
                    row = 0.1,
                    col = 0.9,
                },
            })
        end,
    },
    { "neovim/nvim-lspconfig", },
    { "nvim-treesitter/nvim-treesitter", },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- colorschemes
    { "EdenEast/nightfox.nvim", },
    { "navarasu/onedark.nvim", },
    { "olimorris/onedarkpro.nvim", },
    { "craftzdog/solarized-osaka.nvim", },
    { "tiagovla/tokyodark.nvim", },
    { "sainnhe/sonokai", },
}
