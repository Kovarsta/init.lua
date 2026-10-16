return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		-- Follow the project's Prettier settings; images land in ./assets
		-- by default. Override per project with a .img-clip.lua file.
		default = {
			dir_path = "assets",
		},
	},
	keys = {
		{ "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
	},
}
