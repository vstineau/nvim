return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			term_colors = true,
			transparent_background = false,
			no_italic = false,
			no_bold = false,
			styles = {
				comments = {"italic"},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
-- Couleurs de remplacement spécifiques au thème "mocha"
-- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
-- https://webdi.fr/couleur-hexa.php?c=6883f5
				color_overrides = {
					mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
					surface1 = "#C97778", --tab & number color
					overlay0 = "#B4BEC2", --comment color
					red = "#C92836",
				--	sapphire = "#C92836",
				--	rosewater = "#C92836",
				--	green = "#1F7301",
				--	lavender = "#5C5A9E",
				--	mauve = "#A24DC9",
				--	blue = "#1C38D6",
				--	peach = "#D15E00",
				--	pink = "#FC239B",
					},
				},
-- Remplacements des mises en surbrillance spécifiques au thème "mocha"
				highlight_overrides = {
					mocha = function(C)
					return {
						TabLineSel = { bg = C.pink },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						}
						end,
						},
				}
-- Application du thème
				vim.cmd.colorscheme "catppuccin"
		end,
}
