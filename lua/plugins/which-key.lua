return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			show_help = false,
		})

		require("which-key").add({
			-- Groups
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>p", group = "paste" },
			{ "<leader>q", group = "quickfix" },
			{ "<leader>s", group = "search" },
			{ "<leader>t", group = "test" },
			{ "<leader>u", group = "ui" },
			{ "<leader>x", group = "diagnostics" },

			-- Individual key descriptions
			{ "<leader>e", desc = "Open file explorer" },
			{ "<leader>F", desc = "Format buffer" },
			{ "<leader><Space>", desc = "Find Recent File" },

			-- Find (f group)
			{ "<leader>fF", desc = "Find Files (All)" },
			{ "<leader>ff", desc = "Git Files" },
			{ "<leader>fg", desc = "Live Grep" },
			{ "<leader>fb", desc = "Buffers" },
			{ "<leader>fh", desc = "Help Tags" },
			{ "<leader>fs", desc = "Search in Buffer" },
			{ "<leader>fc", desc = "Command Palette" },

			-- Buffer (b group)
			{ "<leader>bd", desc = "Close current buffer" },
			{ "<leader>bD", desc = "Force close current buffer" },
			{ "<leader>bo", desc = "Close Other Buffers" },
			{ "<leader>br", desc = "Close Buffers to the Right" },
			{ "<leader>bl", desc = "Close Buffers to the Left" },

			-- Git (g group)
			{ "<leader>gg", desc = "Open LazyGit" },
			{ "<leader>gs", desc = "Stage Hunk" },
			{ "<leader>gr", desc = "Reset Hunk" },
			{ "<leader>gS", desc = "Stage Buffer" },
			{ "<leader>gu", desc = "Undo Stage" },
			{ "<leader>gp", desc = "Preview Hunk" },
			{ "<leader>gb", desc = "Blame Line" },

			-- Test (t group)
			{ "<leader>tt", desc = "Test nearest" },
			{ "<leader>tf", desc = "Test file" },
			{ "<leader>td", desc = "Debug test" },
			{ "<leader>ts", desc = "Toggle test summary" },
			{ "<leader>to", desc = "Open test output" },

			-- Diagnostics (x group)
			{ "<leader>xx", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>xL", desc = "Location List (Trouble)" },
			{ "<leader>xQ", desc = "Quickfix List (Trouble)" },

			-- Code (c group)
			{ "<leader>cs", desc = "Symbols (Trouble)" },
			{ "<leader>cl", desc = "LSP Definitions / references / ... (Trouble)" },
			{ "<leader>cc", desc = "Toggle Claude Code assistant" },
			{ "<leader>cC", desc = "Continue Claude Code conversation" },
			{ "<leader>cV", desc = "Claude Code verbose output" },

			-- Paste (p group)
			{ "<leader>ph", desc = "Yank History" },

			-- Quickfix (q group)
			{ "<leader>qq", desc = "Open quickfix list" },
			{ "<leader>qd", desc = "Delete all quickfix entries" },
		})
	end,
}
