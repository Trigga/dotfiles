return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local keymap = vim.keymap

		local on_attach = function()
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP Server" })

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })

			keymap.set("n", "<C-X>", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
			keymap.set("n", "<C-x>", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "vue" },
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "css", "vue" },
		})
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "less", "svelte", "vue" },
		})
	end,
}
