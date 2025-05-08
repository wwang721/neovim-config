return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },

        init = function(plugin)
            -- Ensure custom predicates and queries are available early
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,


        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

        keys = {
            { "<C-space>", desc = "Increment Selection" },
            { "<BS>", desc = "Decrement Selection", mode = "x" },
        },

        opts = {
            highlight = { enable = true, },
            indent = { enable = true },
            ensure_installed = {
                "bash", "c", "cpp", "diff", "html", "javascript", "jsdoc", "json",
                "jsonc", "lua", "luadoc", "luap", "markdown", "markdown_inline",
                "python", "query", "regex", "toml", "tsx",
                "typescript", "vim", "vimdoc", "xml", "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<BS>",
                },
            },
        },
        config = function(_, opts)
            -- Optional: deduplicate manually if needed
            local seen = {}
            if type(opts.ensure_installed) == "table" then
                local filtered = {}
                for _, lang in ipairs(opts.ensure_installed) do
                    if not seen[lang] then
                        table.insert(filtered, lang)
                        seen[lang] = true
                    end
                end
                opts.ensure_installed = filtered
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}

