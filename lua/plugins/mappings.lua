----------
-- Core Mappings
----------
local core_mappings = { i = {}, n = {}, v = {}, o = {}, x = {}, t = {} }

-- map H to ^ and L to $
for _, mode in pairs { "n", "v", "o" } do
    core_mappings[mode]["H"] = "^"
    core_mappings[mode]["L"] = "$"
end

-- change <C-d> and <C-u> to move 8 lines up/down
for _, mode in pairs { "n", "v", "o", "x" } do
    core_mappings[mode]["<C-u>"] = "8k"
    core_mappings[mode]["<C-d>"] = "8j"
end

-- better indenting
core_mappings.v["<"] = "<gv"
core_mappings.v[">"] = ">gv"

-- use U to redo
core_mappings.n["U"] = "<C-r>"

-- clear search highlights
core_mappings.n["<Leader>h"] = {
    "<cmd>nohl<cr>",
    desc = "clear search highlights",
}

-- window management
-- split
core_mappings.n["<Leader>sv"] = {
    "<C-w>v",
    desc = "split window verticaly",
}
core_mappings.n["<Leader>sh"] = {
    "<C-w>s",
    desc = "split window horizontally",
}
core_mappings.n["<Leader>se"] = {
    "<cmd>WindowsEqualize<cr>",
    desc = "make all split windows equal in width & height and enable windows.nvim plugin",
}
core_mappings.n["<Leader>sx"] = {
    "<cmd>close<cr>",
    desc = "close current split window",
}

-- bufferline
core_mappings.n["<Leader>C"] = false
core_mappings.n["<Leader>c"] = false
core_mappings.n["<A-h>"] = {
    "<cmd>BufferLineCyclePrev<cr>",
    desc = "nevigate to prev buffer",
}
core_mappings.n["<A-l>"] = {
    "<cmd>BufferLineCycleNext<cr>",
    desc = "nevigate to next buffer",
}
core_mappings.n["<A-i>"] = {
    "<cmd>BufferLinePick<cr>",
    desc = "choose buffer",
}
core_mappings.n["<A-q>"] = {
    "<cmd>bp|sp|bn|bd!<cr>",
    desc = "close buffer",
}

-- flash
--[[ core_mappings.n["<Leader>jj"] = {
    "<cmd>lua require('flash').jump()<cr>",
    desc = "flash",
}
core_mappings.n["<Leader>jt"] = {
    "<cmd>lua require('flash').treesitter()<cr>",
    desc = "flash treesitter",
}
core_mappings.n["<leader>jc"] = {
    function()
        require("flash").jump {
            pattern = vim.fn.expand "<cword>",
        }
    end,
    desc = "flash the word under cursor",
}
core_mappings.n["<leader>jl"] = {
    function()
        require("flash").jump {
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
        }
    end,
    desc = "flash to a line",
} ]]

-- noice
core_mappings.n["<Leader>mh"] = {
    "<cmd>Noice telescope<cr>",
    desc = "open message history in Telescope",
}
core_mappings.n["<Leader>md"] = {
    "<cmd>Noice dismiss<cr>",
    desc = "dismiss all messages",
}
core_mappings.n["<Leader>ml"] = {
    "<cmd>Noice last<cr>",
    desc = "show the last message in a popup",
}

-- neo-tree
core_mappings.n["<Leader>e"] = {
    "<cmd>Neotree toggle left<cr>",
    desc = "toggle floating neo-tree file explorer",
}

core_mappings.n["<Leader>o"] = {
    "<cmd>Neotree toggle float<cr>",
    desc = "toggle floating neo-tree file explorer",
}

-- format
core_mappings.n["<Leader>w"] = {
    function()
        --[[ vim.lsp.buf.format {
            filter = function(client) return client.name == "null-ls" end,
        } ]]
        vim.lsp.buf.format()
    end,
    desc = "format the buffer with null-ls formatter",
}

core_mappings.n["gd"] = {
    "<cmd>Lspsaga peek_definition<cr>",
    desc = "peek definition",
}
core_mappings.n["gD"] = {
    "<cmd>Lspsaga goto_definition<cr>",
    desc = "go to definition",
}
core_mappings.n["<C-'>"] = false
core_mappings.t["<C-'>"] = false
core_mappings.i["<C-'>"] = false
core_mappings.n["<C-\\>"] = { '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>', desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
core_mappings.t["<C-\\>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
core_mappings.i["<C-\\>"] = { "<Esc><Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminl" } -- requires terminal that supports binding <C-'>

----------
-- LSP Mappings
----------
local lsp_mappings = { i = {}, n = {}, v = {}, o = {}, x = {}, t = {} }

-- lsp_mappings.n["<Leader>d"] = {
--     function() vim.lsp.diagnostic.get_line_diagnostics() end,
-- }
-- lspsaga
lsp_mappings.n["gh"] = {
    "<cmd>Lspsaga finder<cr>",
    desc = "show definition and reference",
}
lsp_mappings.n["gd"] = {
    "<cmd>Lspsaga peek_definition<cr>",
    desc = "peek definition",
}
lsp_mappings.n["gD"] = {
    "<cmd>Lspsaga goto_definition<cr>",
    desc = "go to definition",
}
lsp_mappings.n["[d"] = {
    "<cmd>Lspsaga diagnostic_jump_prev<cr>",
    desc = "jump to previous diagnostic in buffer",
}
lsp_mappings.n["]d"] = {
    "<cmd>Lspsaga diagnostic_jump_next<cr>",
    desc = "jump to next diagnostic in buffer",
}
lsp_mappings.n["<Leader>ull"] = {
    "<cmd>Lspsaga outline<cr>",
    desc = "show outline",
}

return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = core_mappings,
        },
    },
    {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
            mappings = lsp_mappings,
        },
    },
}
