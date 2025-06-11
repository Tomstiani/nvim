return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				vim = { "string" },
				javascript = { "string" },
				javascriptreact = { "string" },
			},
			disable_filetype = { "TelescopePrompt", "vim" },
		})
	end,
}
