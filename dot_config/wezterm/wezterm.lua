-- Wezterm configuration root

local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Fonts
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

-- Colorscheme
config.color_scheme = "MaterialDark"

-- Window

wezterm.on("format-window-title", function()
	return "Terminal"
end)

config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.enable_wayland = false

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Misc

config.audible_bell = "Disabled"

-- Plugins

local sessionizer = wezterm.plugin.require "https://github.com/mikkasendke/sessionizer.wezterm"

local sessionizer_schema = {
  { label = "Some project", id = "~/dev/project" }, -- Custom entry, label is what you see. By default id is used as the path for a workspace.
  "Workspace 1",  -- Simple string entry, expands to { label = "Workspace 1", id = "Workspace 1" }
  sessionizer.DefaultWorkspace {},
  sessionizer.AllActiveWorkspaces {},
  sessionizer.FdSearch "~/my_projects", -- Searches for git repos in ~/my_projects
}

config.keys = {
  { key = "s", mods = "ALT", action = sessionizer.show(sessionizer_schema) },
  -- ... other keybindings ...
}

return config
