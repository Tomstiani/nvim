return {
	"olimorris/codecompanion.nvim",
	enabled = false, -- Disabled in favor of claude-code and supermaven
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},


	config = function()
		require("codecompanion").setup({
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "ollama",
						schema = {
							model = { default = "qwen2.5-coder:14b" },
						},
					})
				end,
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						name = "anthropic",
						schema = {
							model = { default = "claude-3-5-haiku-20241022" },
						},
					})
				end,
			},

			strategies = {
				chat = { adapter = "ollama" },
				inline = {
					adapter = "ollama",
					keymaps = {
						accept_change = { modes = { n = "ca" }, description = "Accept the change" },
						reject_change = { modes = { n = "cr" }, description = "Reject the change" },
					},
				},
				cmd = { adapter = "ollama" },
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
