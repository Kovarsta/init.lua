return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = function(bufnr)
				-- `.svelte` needs prettier-plugin-svelte. The Svelte LSP runs the
				-- project's own Prettier and also works when the project ships no
				-- Prettier, so prefer it there. Everything else keeps the normal
				-- "use LSP only if no formatter is configured" fallback.
				local lsp_format = vim.bo[bufnr].filetype == "svelte" and "prefer" or "fallback"
				return { timeout_ms = 10000, lsp_format = lsp_format }
			end,
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
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				-- Svelte needs prettier-plugin-svelte. Prefer the Svelte LSP, which
				-- runs the project's own Prettier (tabs/quotes/plugins) and also
				-- works when the project ships no Prettier at all. prettierd/prettier
				-- stay as a fallback for when the Svelte server is not attached.
				svelte = { "prettierd", "prettier", stop_after_first = true, lsp_format = "prefer" },
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
