return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"rafamadriz/friendly-snippets",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"clang-format",
				"black",
				"debugpy",
				"stylua",
				"prettierd",
				"prettier",
				"yamlfmt",
			},
		})

		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		
		local ls = require("luasnip")    
		require("luasnip.loaders.from_vscode").lazy_load()
		ls.filetype_extend("javascriptreact", { "html", "javascript" })
		ls.filetype_extend("typescriptreact", { "html", "typescript" })
		ls.filetype_extend("svelte", { "html", "javascript", "typescript" })

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"harper_ls",
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"tailwindcss",
				"pyright",
				"cssls",
				"clangd",
				"emmet_ls",
				"eslint",
				"svelte",
			},
		})

		-- mason-lspconfig v2 removed the `handlers` option: installed servers are
		-- enabled automatically through vim.lsp.enable() using nvim-lspconfig's
		-- default configs. Per-server options are set with vim.lsp.config(), which
		-- layers on top of those defaults (see :h vim.lsp.config()).
		vim.lsp.config("*", { capabilities = capabilities })

		vim.lsp.config("zls", {
			root_dir = function(fname)
				return vim.fs.root(fname, { ".git", "build.zig", "zls.json" })
			end,
			settings = {
				zls = {
					enable_inlay_hints = true,
					enable_snippets = true,
					warn_style = true,
				},
			},
		})
		vim.g.zig_fmt_parse_errors = 0
		vim.g.zig_fmt_autosave = 0

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
				},
			},
		})

		vim.lsp.config("tailwindcss", {
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"heex",
			},
		})

		-- The Svelte server maintains a whole-project TypeScript program. Its
		-- diagnostics and workspace symbols are the most expensive parts and are
		-- what make it feel slow on large projects. Completions (including
		-- imports), hover and go-to-definition are kept.
		vim.lsp.config("svelte", {
			settings = {
				svelte = {
					plugin = {
						typescript = {
							diagnostics = { enable = false },
							workspaceSymbols = { enable = false },
						},
					},
				},
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "path" },
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
