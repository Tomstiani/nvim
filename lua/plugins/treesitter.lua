return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "tsx", "javascript", "typescript", "html", "css", "lua" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
