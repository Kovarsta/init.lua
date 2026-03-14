return {
  "folke/noice.nvim",
  event = "VeryLazy", -- This ensures it doesn't fight with Alpha during startup
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- your config here
    })
  end,
}