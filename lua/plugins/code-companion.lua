return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},

	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat toggle<cr>", { desc = "Toggle CodeCompanionChat" } },
		{ "<leader>ca", "<cmd>CodeCompanionAction", { desc = "CodeCompanionAction" } },
	},

	config = function()
		require("codecompanion").setup({
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "ollama",
						schema = {
							model = {
								default = "codellama:13b",
							},
						},
					})
				end,
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						name = "anthropic",
					})
				end,
			},

			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
					keymaps = {
						accept_change = {
							modes = { n = "ca" },
							description = "Accept the change",
						},
						reject_change = {
							modes = { n = "cr" },
							description = "Reject the change",
						},
					},
				},
				cmd = {
					adapter = "ollama",
				},
			},

			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
		})
	end,
}
