---@diagnostic disable: unused-local
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local nerdfonts = wezterm.nerdfonts
local config = {}

-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

if is_windows then
	config.default_prog = { "pwsh.exe", "-l" }
end

-- Events
wezterm.on("format-window-title", function(tab, pane)
	return string.gsub(pane.current_working_dir, "(.*[/\\])(.*)", "%2")
end)

wezterm.on("format-tab-title", function(tab)
	return tab.tab_index + 1 .. ": " .. string.gsub(tab.active_pane.current_working_dir, "(.*[/\\])(.*)", "%2")
end)

wezterm.on("update-right-status", function(window, pane)
	local stat = window:active_workspace()
	if window:active_key_table() then
		stat = window:active_key_table()
	end
	if window:leader_is_active() then
		stat = "LEADER"
	end
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#808080" } },
		{ Text = nerdfonts.oct_table .. "   " .. stat },
		{ Text = "   " },
	}))
end)

-- Settings
config.font = wezterm.font_with_fallback({
	{ family = "ComicShannsMono Nerd Font" },
})
config.use_fancy_tab_bar = true
config.default_workspace = "default"
config.color_scheme = "nord"

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },

	-- Splits
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Move between Panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- Adjust Pane size
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- Close Pane
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

	-- Zoom Pane
	{ key = "%", mods = "LEADER|SHIFT", action = act.TogglePaneZoomState },

	-- Search
	{ key = "s", mods = "LEADER", action = act.Search({ CaseInSensitiveString = "" }) },

	-- New Tab
	{ key = "n", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },

	-- Move between Tabs
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

	-- Switch to Tab
	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },

	-- Tab switcher
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },

	-- Move Tab
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

	-- Close Tab
	{ key = "d", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },

	-- New Window
	{ key = "N", mods = "LEADER", action = act.SpawnWindow },

	-- Copy Mode
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },

	-- Workspace switcher
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

	-- Create Workspace
	{
		key = "W",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter name for new workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line and line ~= "" then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},

	-- Show Launcher Menu
	{ key = "p", mods = "LEADER", action = act.ShowLauncher },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

return config
