return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = true,
			transparent = true,
			terminalColors = true,
			dimInactive = false,
			theme = "wave", -- force dragon theme

			overrides = function(colors)
				local theme = colors.theme
				return {
					-- Transparent floats
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },

					-- Remove gutter background (line numbers, signs, folds, etc)
					SignColumn = { bg = "none" },
					FoldColumn = { bg = "none" },
					LineNr = { bg = "none" },

					-- Telescope UI
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

					["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
					["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
					["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
					["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
					["@markup.list.markdown"] = { link = "Function" }, -- + list
					["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
				}
			end,

			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none", -- full transparency on side gutters
						},
					},
				},
			},

			background = {
				dark = "wave",
				light = "lotus",
			},
		})

		-- Load the compiled colorscheme
		vim.cmd("colorscheme kanagawa")

		-- Recompile the theme if needed
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyDone",
			callback = function()
				vim.cmd("KanagawaCompile")
			end,
		})
	end,
}

