return {
	"luckasRanarison/tailwind-tools.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		document_color = {
			enabled = true,
			kind = "background", -- "background" | "foreground"
		},
		conceal = {
			enabled = false, -- if true, replaces class names with icons/colors
			symbol = "󱏿", -- custom conceal symbol
		},
		custom_filetypes = {
			"typescriptreact",
			"javascriptreact",
			"html",
			"astro",
			"svelte",
		},
	},
}
