local wez = require("wezterm")
local config = wez.config_builder()

config.font_size = 15.0
config.color_scheme = "rose-pine-moon"
config.initial_rows = 35
config.initial_cols = 156
config.line_height = 1.15
config.automatically_reload_config = true

config.enable_tab_bar = true -- kill wezterm tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false

config.window_background_opacity = 0.8
config.window_padding = { left = 0, right = 0, top = 30, bottom = 10 }
config.macos_window_background_blur = 50
config.window_decorations = "RESIZE"

if wez.target_triple:find("linux") then
	config.window_background_opacity = 0.975
	config.window_decorations = "NONE"
end

-- config.window_background_image = "/Users/sidsurakanti/dotfiles/wallpapers/stars.jpg"
config.window_background_image_hsb = {
	brightness = 0.05,
	saturation = 1.2,
}

-- i only use this on mac
config.keys = {
	{
		key = "n",
		mods = "SUPER|SHIFT",
		action = wez.action.ToggleFullScreen,
	},
}

config.warn_about_missing_glyphs = false

return config
