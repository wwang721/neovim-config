return {
    "neovim/nvim-lspconfig",
    version = "0.1.7",  -- latest version that works with Neovim 0.9.x
    dependencies = { "williamboman/mason-lspconfig.nvim" },
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
