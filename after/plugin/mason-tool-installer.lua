require('mason-tool-installer').setup {
    ensure_installed = { "stylua" },
    integrations = {
        ['mason-lspconfig'] = true,
        ['mason-null-ls'] = true,
        ['mason-nvim-dap'] = true,
    },
}
