require("kovarsta.lazy")
require("kovarsta.remap")
require("kovarsta.set")

vim.api.nvim_create_autocmd("InsertLeave", {
    group = vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true }),
    callback = function()
        vim.cmd("silent! update")
    end,
})

vim.api.nvim_create_autocmd("FocusLost", {
    group = "AutoSaveGroup",
    callback = function()
        vim.cmd("silent! wall")
    end,
})
