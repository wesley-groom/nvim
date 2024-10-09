local options = {
	-- visual
	number = true, -- set numbered lines
	hlsearch = true, -- highlight all matches on previous search pattern
	termguicolors = true, -- set terminal gui colors

	-- indenting
	tabstop = 4, -- insert 4 spaces for a tab
	shiftwidth = 4, -- number of spaces to use for autoindent
	expandtab = true, -- convert tabs to spaces
	smartindent = true, -- make indenting smarter
	autoindent = true, -- auto indenting

	-- convenience
	mouse = "a", -- allow use of a mouse
	clipboard = "unnamedplus", -- allow access to system clipboard

	fileencoding = "utf-8", -- the encoding written to a file
	hidden = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
