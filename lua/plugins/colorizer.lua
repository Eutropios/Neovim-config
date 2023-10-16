local M = {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			AARRGGBB = false, -- 0xAARRGGBB hex codes
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			hsl_fn = true, -- CSS hsl() and hsla() functions
			mode = "background", -- Set the display mode.
			-- Available modes for `mode`: foreground, background,  virtualtext
			names = true, -- "Name" codes like Blue or blue
			rgb_fn = true, -- CSS rgb() and rgba() functions
			tailwind = true,
			virtualtext = "■",
		},
	},
}

return M
