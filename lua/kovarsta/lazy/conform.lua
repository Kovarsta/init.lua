return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			-- `.svelte` is formatted by the Svelte LSP (see formatters_by_ft).
			-- That server can take minutes to warm up on large projects while it
			-- loads the dependency graph, and format_on_save is synchronous, so
			-- formatting it on save would freeze the editor. Format it after
			-- save instead, which runs asynchronously and writes the result back.
			-- Everything else keeps the synchronous path and the normal
			-- "use LSP only if no formatter is configured" fallback.
			format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype == "svelte" then
					return nil
				end
				return { timeout_ms = 10000, lsp_format = "fallback" }
			end,
			format_after_save = function(bufnr)
				if vim.bo[bufnr].filetype ~= "svelte" then
					return nil
				end
				return { timeout_ms = 10000, lsp_format = "prefer" }
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
