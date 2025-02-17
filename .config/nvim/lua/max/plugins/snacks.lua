return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		lazygit = {},
	},
    -- stylua: ignore start
    keys = {
        { "<leader>gl",    function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg",    function() Snacks.lazygit() end, desc = "Lazygit" },
    }
	-- stylua: ignore end
,
}
