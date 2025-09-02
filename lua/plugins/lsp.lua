return {
	-- LSP installer UI
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- Integration between mason and lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			automatic_enable = false,
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"biome",
			},
		},
	},

	-- LSP configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				ts_ls = {
					-- root_dir = function(...)
					-- 	return require("lspconfig.util").root_pattern(".git")(...)
					-- end,
				},
				html = {},
				cssls = {},
				tailwindcss = {},
				biome = {},
			}

			for server, opts in pairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					settings = opts,
				})
			end
		end,
	},
}
