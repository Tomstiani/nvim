return {
	-- Buffer tab UI
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					show_buffer_close_icons = true,
					show_close_icon = false,
					always_show_bufferline = true,
					custom_filter = function(buf_number, buf_numbers)
						local buf_name = vim.fn.bufname(buf_number)
						local buf_ft = vim.bo[buf_number].filetype
						
						-- Filter out claude-code buffers by name or filetype
						if buf_name:match("claude") or buf_name:match("Claude") or buf_ft == "claude-code" then
							return false
						end
						
						return true
					end,
				},
			})

			-- Helper functions

			local close_left = function()
				local current = vim.fn.bufnr()
				local buffers = vim.fn.getbufinfo({ buflisted = 1 })
				for _, buf in ipairs(buffers) do
					if buf.bufnr < current then
						vim.cmd("bdelete " .. buf.bufnr)
					end
				end
			end

			local close_right = function()
				local current = vim.fn.bufnr()
				local buffers = vim.fn.getbufinfo({ buflisted = 1 })
				for _, buf in ipairs(buffers) do
					if buf.bufnr > current then
						vim.cmd("bdelete " .. buf.bufnr)
					end
				end
			end

			local close_others = function()
				local current = vim.fn.bufnr()
				local buffers = vim.fn.getbufinfo({ buflisted = 1 })
				for _, buf in ipairs(buffers) do
					if buf.bufnr ~= current then
						vim.cmd("bdelete " .. buf.bufnr)
					end
				end
			end

			-- Navigation
			vim.keymap.set("n", "<S-L>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<S-H>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

			-- Buffer close helpers
			vim.keymap.set("n", "<leader>bo", close_others, { desc = "Close Other Buffers" })
			vim.keymap.set("n", "<leader>br", close_right, { desc = "Close Buffers to the Right" })
			vim.keymap.set("n", "<leader>bl", close_left, { desc = "Close Buffers to the Left" })
		end,
	},

	-- Better buffer removal
	{
		"echasnovski/mini.bufremove",
		config = function()
			vim.keymap.set("n", "<leader>bd", function()
				require("mini.bufremove").delete(0, false)
			end, { desc = "Close current buffer" })

			vim.keymap.set("n", "<leader>bD", function()
				require("mini.bufremove").delete(0, true)
			end, { desc = "Force close current buffer" })
		end,
	},
}
