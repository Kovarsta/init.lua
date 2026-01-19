require("mason-tool-installer").setup({
	ensure_installed = { "stylua", "prettierd", "prettier", "black" },
	integrations = {
		["mason-lspconfig"] = true,
		["mason-null-ls"] = true,
		["mason-nvim-dap"] = true,
	},
})
