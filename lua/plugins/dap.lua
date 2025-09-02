return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{ "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
			{ "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
			{ "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
			{ "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Debug: Conditional Breakpoint" },
			{ "<leader>dr", function() require("dap").repl.open() end, desc = "Debug: Open REPL" },
			{ "<leader>dl", function() require("dap").run_last() end, desc = "Debug: Run Last" },
		},
		config = function()
			local dap = require("dap")

			-- JavaScript/TypeScript debugging will be configured by mason-nvim-dap
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		keys = {
			{ "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
			{ "<leader>de", function() require("dapui").eval() end, desc = "Debug: Evaluate Expression" },
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mason.nvim", "nvim-dap" },
		opts = {
			ensure_installed = { "js-debug-adapter" },
			automatic_installation = true,
		},
	},
}