-- Customize None-ls sources

---@type LazySpec
return {
    "nvimtools/none-ls.nvim",
    opts = function(_, config)
        -- config variable is the default configuration table for the setup function call
        -- local null_ls = require "null-ls"
        local formatting = require("null-ls").builtins.formatting
        -- local diagnostics = require("null-ls").builtins.diagnostics

        -- Check supported formatters and linters
        -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        config.sources = {
            -- Set a formatter
            -- formatting.stylua,
            formatting.clang_format.with {
                disabled_filetypes = {
                    "JSON",
                    "Java",
                    "JavaScript",
                },
            }, -- C/C++ formatter
            --[[ require("none-ls.diagnostics.eslint").with {
                condition = function(utils)
                    return true
                    -- return utils.root_has_file ".eslintrc.cjs" -- change file extension if you use something else
                end,
            }, ]]
        }
        return config -- return final config table
    end,
}
