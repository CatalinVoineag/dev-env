function ColorMyPencils(color)
	color = color or "tokyonight"
	pcall(vim.cmd.colorscheme, color)
end

ColorMyPencils()
