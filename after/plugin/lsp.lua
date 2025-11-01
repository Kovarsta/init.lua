require("mason").setup()
require("fidget").setup({})
require("conform").setup({ formatters_by_ft = {} })
local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	cmp_lsp.default_capabilities()
)

local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' },
        { name = 'path' },
    })
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		'.luarc.json',
		'.luarc.jsonc',
		'.luacheckrc',
		'.stylua.toml',
		'stylua.toml',
		'selene.toml',
		'selene.yml',
		'.git',
	},
	settings = {
		Lua = {
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
				}
			},
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
		}
	}
})
vim.lsp.enable("lua_ls")

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	filetypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	settings = {
		typescript = {
			server = {
				cmd = { "typescript-language-server", "--stdio" }
			}
		}
	}
})
vim.lsp.enable("ts_ls")

vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
	cmd = { "tailwindcss-language-server" },
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
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.ts",
		"package.json",
		".git",
	},
})
vim.lsp.enable("tailwindcss")

vim.lsp.config("pyright", {
	capabilities = capabilities,
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"Pipfile",
		"requirements.txt",
		".git",
	},
	settings = {
		pyright = {
			disableOrganizeImports = false,
			disableCodeActions = false,
		},
	},
})
vim.lsp.enable("pyright")

vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
