return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" }, -- For icons in FZF
  opts = {
    previewers = {
      builtin = {
        syntax_highlight = true,
      },
      bat = {
        theme = "Dracula", -- or Gruvbox/Dark etc.
        args = "--style=numbers,changes --color=always",
      },
    },
    files = {
      previewer = "bat"
    },
    grep = {
      previewer = "bat"
    }
  },
  keys = {
    -- Core
    { "<leader>ff", function() require("fzf-lua").files() end, desc = "󰍉 Find Files" },
    { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "󰱽 Live Grep in Project" },
    { "<leader>fn", function() require("fzf-lua").files({cwd = vim.fn.stdpath("config")}) end, desc = " Find Neovim Config Files" },
    { "<leader><leader>", function() require("fzf-lua").buffers() end, desc = " Open Buffers" },

    -- Extras
    { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "󰋖 Help Tags" },
    { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "󰌌 Keymaps" },
    { "<leader>fb", function() require("fzf-lua").builtin() end, desc = " FZF Builtins" },
    { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = " Grep word under cursor" },
    { "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = " Grep WORD under cursor" },
    { "<leader>fd", function() require("fzf-lua").diagnostics() end, desc = " Diagnostics" },
    { "<leader>fr", function() require("fzf-lua").resume() end, desc = "󰑍 Resume last search" },
    { "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "󰄉 Recently Opened Files" },
    { "<leader>fB", function() require("fzf-lua").grep_current_buffer() end, desc = "󰅺 Grep in Current Buffer" },
  },
}
