return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    -- lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        hide_root_node = false, -- Hide the root node.
        window = {
            width = 30,
        },
        source_selector = {
            winbar = false,
            statusline = false,
        },
        filesystem = {
            filtered_items = {
                visible = true, -- show hidden files
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        }
    },
    cmd = "Neotree",
    keys = {
        {
            "<F2>",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        {
            "<F4>",
            function()
            require("neo-tree.command").execute({
                toggle = true,
                reveal = true,
                reveal_force_cwd = true,
            })
            end,
            desc = "Explorer NeoTree (reveal current active file)",
        },
    },
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end
}
