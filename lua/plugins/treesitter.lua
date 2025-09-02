return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { 
				"tsx", "javascript", "typescript", "html", "css", "lua",
				"json", "yaml", "markdown", "bash", "python", "vim", "vimdoc"
			},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
