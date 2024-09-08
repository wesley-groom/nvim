local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("wes.lsp.mason")
require("wes.lsp.handlers").setup()
require("wes.lsp.null-ls")
