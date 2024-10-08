vim.treesitter.language.register("devicetree", "overlay")

local M = {}

function M.config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"c",
			"python",
			"devicetree",
			"kconfig",
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
		},
		ignore_install = { "" },
		sync_install = false,
		highlight = {
			enable = true,
			disable = { "css" },
		},
		autopairs = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { "python", "css" },
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
