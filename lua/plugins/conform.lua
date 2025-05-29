return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
				markdown = { "biome" },
			},

			formatters = {
				biome = {
					command = "biome",
					args = {
						"format",
						"--stdin-file-path",
						"$FILENAME",
						"--fix",
					},
				},
				stdin = true,
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},

			notify_on_error = true, -- Optional
		})

		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })
	end,
}
