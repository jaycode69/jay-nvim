return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    init = function()
        local ts_config = require("nvim-treesitter.configs")

        ts_config.setup({
            textobjects = {

                -- ✂️ SELECT: Classic Vim-style textobjects like vaf, if, etc.
                select = {
                    enable = true,
                    lookahead = true, -- move cursor to next object automatically

                    keymaps = {
                        -- Functions
                        ["af"] = "@function.outer", -- around function
                        ["if"] = "@function.inner", -- inner function

                        -- Classes
                        ["ac"] = "@class.outer", -- around class
                        ["ic"] = "@class.inner", -- inner class

                        -- Parameters
                        ["aa"] = "@parameter.outer", -- around argument
                        ["ia"] = "@parameter.inner", -- inner argument

                        -- Loops
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- Conditionals
                        ["ai"] = "@conditional.outer", -- around if
                        ["ii"] = "@conditional.inner",

                        -- Blocks
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",

                        -- Scope selector (e.g. local function block)
                        ["as"] = {
                            query = "@scope",
                            query_group = "locals",
                            desc = "Around language scope",
                        },
                    },

                    selection_modes = {
                        ["@parameter.outer"] = "v",     -- charwise
                        ["@function.outer"]  = "V",     -- linewise
                        ["@class.outer"]     = "<c-v>", -- blockwise
                    },

                    include_surrounding_whitespace = true,
                },

                -- 🔁 SWAP: Swap parameters using cool mnemonics
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>sn"] = "@parameter.inner", -- s = swap, n = next
                    },
                    swap_previous = {
                        ["<leader>sp"] = "@parameter.inner", -- p = previous
                    },
                },

                -- 🏃 MOVE: Ninja jumps between objects
                move = {
                    enable = true,
                    set_jumps = true, -- keep jump history

                    goto_next_start = {
                        ["]f"] = "@function.outer",   -- jump to next function
                        ["]c"] = "@class.outer",      -- next class
                        ["]a"] = "@parameter.inner",  -- next argument
                    },

                    goto_previous_start = {
                        ["[f"] = "@function.outer",   -- jump to previous function
                        ["[c"] = "@class.outer",      -- prev class
                        ["[a"] = "@parameter.inner",  -- prev argument
                    },
                },

                -- 👀 PEEK (disabled until you say "go")
                -- lsp_interop = {
                --   enable = true,
                --   border = "rounded",
                --   peek_definition_code = {
                --     ["<leader>df"] = "@function.outer",
                --     ["<leader>dc"] = "@class.outer",
                --   },
                -- },
            },
        })

        -- 🔑 Optional Which-Key integration for discoverability
        -- Commented out now, but ready when you are
        -- Pro tip: enable it when sharing config with others

        -- local wk = require("which-key")
        -- wk.register({
        --   a = {
        --     name = "Around Textobjects",
        --     f = "Function",
        --     c = "Class",
        --     a = "Argument",
        --     l = "Loop",
        --     i = "If / Conditional",
        --     b = "Block",
        --     s = "Scope",
        --   },
        --   i = {
        --     name = "Inner Textobjects",
        --     f = "Function",
        --     c = "Class",
        --     a = "Argument",
        --     l = "Loop",
        --     i = "If / Conditional",
        --     b = "Block",
        --   },
        --   ["<leader>s"] = {
        --     name = "Swap Parameters",
        --     n = "Swap Next Param",
        --     p = "Swap Prev Param",
        --   },
        --   ["]"] = {
        --     name = "Next",
        --     f = "Next Function",
        --     c = "Next Class",
        --     a = "Next Argument",
        --   },
        --   ["["] = {
        --     name = "Previous",
        --     f = "Prev Function",
        --     c = "Prev Class",
        --     a = "Prev Argument",
        --   },
        -- })

    end,
}
