return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
	
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup() -- don't delete or me no worky
		
		-- Harpoon2 Keymaps
		-- Basic management
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, 
			{ desc = "Harpoon: [A]ppend file to list" })

		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 
			{ desc = "Harpoon: Toggle quick [E]xplorer menu" })

		-- Direct Navigation (Slots 1-4)
		-- Perfect for jumping to your Bun terminal or main project files
		vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, 
			{ desc = "Harpoon: Select file 1" })

		vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, 
			{ desc = "Harpoon: Select file 2" })

		vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, 
			{ desc = "Harpoon: Select file 3" })

		vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, 
			{ desc = "Harpoon: Select file 4" })

		-- Relative Navigation
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, 
			{ desc = "Harpoon: Go to [P]revious in list" })

		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, 
			{ desc = "Harpoon: Go to [N]ext in list" })
		
	end
}