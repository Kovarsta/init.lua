return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 10000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				go = { "gofmt" },
				python = { "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				elixir = { "mix" },
				yaml = { "yamlfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
