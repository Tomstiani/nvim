return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup({
			window = {
				position = "vertical",
			},
			file_refresh = {
				enabled = true,
				interval = 1000,
			},
		})
		
		-- Hide claude-code buffers from bufferline
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "claude-code",
			callback = function()
				vim.bo.buflisted = false
			end,
		})
		
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*claude*",
			callback = function()
				if vim.bo.buftype == "" and vim.fn.bufname():match("claude") then
					vim.bo.buflisted = false
				end
			end,
		})
	end,
}
