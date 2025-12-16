-- Set leader to Space
vim.g.mapleader = " "

-- [ File Navigation ]
-- Open the native file explorer (Netrw)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Project View (Explorer)" })

-- [ Movement & Centering ]
-- Keep cursor centered when scrolling half-pages
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep search terms centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Join lines without moving the cursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (keep cursor steady)" })

-- [ Visual Mode Manipulations ]
-- Move highlighted blocks of text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- [ Clipboard & Registers ]
-- Paste without overwriting the current register (the "Greatest Paste")
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and keep buffer" })

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete into the void register (doesn't overwrite yanked text)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- [ Quickfix & Location Lists ]
-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix item" })

-- Location list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev location item" })

-- [ Utility / Misc ]
-- Disable Ex-mode (prevents accidental 'Q' presses)
vim.keymap.set("n", "Q", "<nop>")

-- Open tmux-sessionizer (External script required)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open Tmux Sessionizer" })

-- Search and replace the word you are currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find and replace word under cursor" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Chmod +x current file" })

-- Toggle Neotree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree Explorer' })

-- Changing first line from 0 and last $ to 1 and 2
vim.keymap.set({ 'n', 'v', 'o' }, '<F1>', '0')
vim.keymap.set({ 'n', 'v', 'o' }, '<F2>', '$')

-- Shift 0 and $ smarter
vim.keymap.set({ 'n', 'v', 'o' }, '<S-F1>', '^')
vim.keymap.set({ 'n', 'v', 'o' }, '<S-F2>', '$')

