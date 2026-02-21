local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.enable_wayland = false
config.front_end = "Software"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 60
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.font = wezterm.font("Iosevka NF Medium")
config.cell_width = 0.9
config.window_background_opacity = 0.75
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

config.keys = {
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
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "CTRL|ALT",
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
	{
		key = "u",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "Fabian von der Hood zu nem Huracan",
		}),
	},
	{
		key = "1",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Sibille",
		}),
	},
	{
		key = "2",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Tropschuh",
		}),
	},
	{
		key = "3",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Während du Kakao trinkst kämpfen wir für dich",
		}),
	},
	{
		key = "4",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Zum Glück bist du noch bei Mioa",
		}),
	},
	{
		key = "5",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Mama guck wir können reich sein",
		}),
	},
	{
		key = "6",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Ich mach Songs für den Block keine Shishalieder",
		}),
	},
	{
		key = "7",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Bei Nacht Grabräuba",
		}),
	},
	{
		key = "8",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Ey Mom träumen ich bin Tagträumer",
		}),
	},
	{
		key = "9",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Ich will den ganzen Kuchen keine Reste",
		}),
	},
	{
		key = "0",
		mods = "CTRL|ALT",
		action = act.SwitchToWorkspace({
			name = "Wenn die Wölfe wieder jagen auf der Straße und die Mütter weinen weißt du dass es Nacht ist",
		}),
	},
	-- Switch to a monitoring workspace, which will have `top` launched into it
	-- Create a new workspace with a random name and switch to it
	{ key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "ß",
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
	-- background = "#16141a",
	background = "#232136",
	cursor_border = "#bea3c7",
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
			bg_color = "#0c0b0f",
			fg_color = "white",
		},
	},
}

config.window_decorations = "NONE | RESIZE"
config.initial_cols = 80
config.default_prog = { "pwsh", "--noLogo" }
config.underline_position = "-1px"
config.underline_thickness = "2px"

return config
