return {
    -- not needed for Neovim >= v0.10 if only usd in local machine, not through SSH
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
        local osc52 = require("osc52")
        -- yank to system clipboard on copy
        vim.api.nvim_create_autocmd("TextYankPost", {
            callback = function()
                if vim.v.event.operator == "y" and vim.v.event.regname == "" then
                    osc52.copy_register('"')
                end
            end,
        })
    end,
}
