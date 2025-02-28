-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

local vim_opts = { -- vim.opt.<key>
    relativenumber = true,
    number = true,
    spell = false,
    signcolumn = "yes",
    wrap = true,
    -- indentation
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smarttab = true,
    autoindent = true,
    -- search
    ignorecase = true,
    smartcase = true,

    cursorline = true,
    termguicolors = true,
    colorcolumn = "80",

    backspace = "indent,eol,start",

    splitright = true,
    splitbelow = true,

    fileencoding = "UTF-8",

    -- remain lines around cursor
    scrolloff = 8,
    sidescrolloff = 8,

    -- show invisible characters
    list = true,
    listchars = {
        space = "·",
        tab = ">~",
        eol = "↴",
        trail = "■",
    },

    wildmenu = true,
    completeopt = "menu,menuone,noselect",

    timeout = true,
    timeoutlen = 300,

    -- for avante
    laststatus = 3,
}

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = true, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = vim_opts,
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                -- ["<Leader>b"] = { desc = "Buffers" },

                -- setting a mapping to false will disable it
                -- ["<C-S>"] = false,
            },
        },
    },
}
