-- Customize Mason plugins

---@type LazySpec
return {
    -- use mason-lspconfig to configure LSP installations
    {
        "williamboman/mason-lspconfig.nvim",
        -- overrides `require("mason-lspconfig").setup(...)`
        opts = {
            ensure_installed = {
                "lua_ls",
                -- can't figure out how to configure ^2.0.0 volar to work
                -- "volar@1.8.27",
                -- add more arguments for adding more language servers
            },
        },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        -- overrides `require("mason-null-ls").setup(...)`
        opts = {
            ensure_installed = {
                "stylua",
                -- add more arguments for adding more null-ls sources
            },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = {
            ensure_installed = {
                "c",
                -- add more arguments for adding more debuggers
            },
        },
    },
}
