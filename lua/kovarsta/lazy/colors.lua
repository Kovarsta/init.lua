function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,

        opts = {
            integrations = {
                lualine = true,
            },
        },

        config = function()
            ColorMyPencils("catppuccin")
        end
    },
}