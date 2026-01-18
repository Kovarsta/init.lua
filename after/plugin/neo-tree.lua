require('neo-tree').setup({
    close_if_last_window = true,         -- auto-close Neovim if Neo-tree is the last window
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
        position = 'left',
        width = 30,
    },
    filesystem = {
        follow_current_file = {
            enabled = true,                  -- automatically reveal the current file when you switch buffers
        },
        use_libuv_file_watch = true,         -- use a more efficient file watcher
    },
    -- you can configure other 'sources' (buffers, git status) here if desired
    -- install nerd font if your icon thinggimajig is broken <?>
})

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree Explorer' })
