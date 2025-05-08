return {
    "neovim/nvim-lspconfig",
    version = "0.1.7", -- latest version works with Neovim 0.9.x
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "williamboman/mason.nvim",
            version = "1.1.0",
            config = true, -- equivalent to require("mason").setup()
        },
        {
            "williamboman/mason-lspconfig.nvim",
            version = "1.29.0"
        },
        {
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "pyright", "clangd", "bashls" },
            automatic_installation = false,
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        
        -- Setup handlers for installed servers
        require("mason-lspconfig").setup_handlers({
            function(server)
                lspconfig[server].setup({ capabilities = capabilities })
            end,
        })
    end,
}
