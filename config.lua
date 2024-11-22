local wezterm = require('wezterm')
local config = {}
config.window_background_opacity = 0.3
config.text_background_opacity = 0.3
config.window_background_image = "\\Users\\bg.png"

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 1.0,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

return config
