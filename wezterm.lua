local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 30
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.font_dirs = { "fonts" }
config.font = wezterm.font("Iosevka NF")
config.cell_width = 0.9
config.window_background_opacity = 0.6
config.prefer_egl = true
config.font_size = 14.0

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- color scheme toggling
-- wezterm.on("toggle-colorscheme", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if overrides.color_scheme == "Zenburn" then
-- 		-- overrides.color_scheme = "Cloud (terminal.sexy)"
-- 		overrides.color_scheme = "rose-pine-moon"
-- 	else
-- 		overrides.color_scheme = "Zenburn"
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

-- keymaps
config.keys = {
	-- {
	-- 	key = "e",
	-- 	mods = "CTRL|SHIFT|ALT",
	-- 	action = wezterm.action.EmitEvent("toggle-colorscheme"),
	-- },
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "o",
		mods = "CTRL|ALT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.85
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
	{
		key = "y",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "default",
		}),
	},
	-- Switch to a monitoring workspace, which will have `top` launched into it
	{
		key = "u",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "monitoring",
		}),
	},
	-- Create a new workspace with a random name and switch to it
	{ key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "9",
		mods = "CTRL|ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

-- For example, changing the color scheme:
-- config.color_scheme = "Cloud (terminal.sexy)"
config.color_scheme = "rose-pine-moon"
config.colors = {
	-- background = "#3b224c",
	-- background = "#181616", -- vague.nvim bg
	-- background = "#080808", -- almost black
	-- background = "#0c0b0f", -- dark purple
	-- background = "#020202", -- dark purple
	-- background = "#1e2326", -- everforest
	-- background = "#17151c", -- rose pine
	background = "#16141a",
	cursor_border = "#bea3c7",
	-- cursor_fg = "#281733",
	cursor_bg = "#87a2e8",
	selection_fg = "#87a2e8",
	selection_bg = "#87a2e8",

	tab_bar = {
		background = "#0c0b0f",
		active_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#bea3c7",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#f8f2f5",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		new_tab = {
			-- bg_color = "rgba(59, 34, 76, 50%)",
			bg_color = "#0c0b0f",
			fg_color = "white",
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "Iosevka NF", weight = "Regular" }),
	active_titlebar_bg = "#0c0b0f",
	-- active_titlebar_bg = "#181616",
}

-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "NONE | RESIZE"
-- config.default_prog = {"pwsh", "-NoLogo"}
config.default_prog = { "bash" }
config.initial_cols = 80
config.underline_position = "-1px"
config.underline_thickness = "2px"
-- config.window_background_image = "C:/dev/misc/berk.png"
-- config.window_background_image_hsb = {
-- 	brightness = 0.1,
-- }

-- and finally, return the configuration to wezterm
return config
