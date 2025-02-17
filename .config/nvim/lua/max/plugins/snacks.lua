return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {},
		-- git = {},
		input = {},
		lazygit = {},
		picker = {
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } }, -- to close the picker on ESC instead of going to normal mode
						["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
					},
				},
			},
		},
	},
    -- stylua: ignore start
    keys = {
        { "<leader>gl",    function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg",    function() Snacks.lazygit() end, desc = "Lazygit" },
        -- find
		{ "<leader>f", "", desc = "+find", mode = { "n", "v" } },
        { "<leader>ff", function() Snacks.picker.smart() end, desc = "Find Files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- git
        { "<leader>fg", function() Snacks.picker.git_status() end, desc = "Git Status" },
        -- Grep
        { "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>fR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>fz", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        -- LSP
        { "<leader>gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "<leader>gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "<leader>gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "<leader>gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    }
	-- stylua: ignore end
,
}
