---@diagnostic disable: unused-local
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local is_macos_intel = wezterm.target_triple == "x86_64-apple-darwin"
local is_macos_silicon = wezterm.target_triple == "aarch64-apple-darwin"

if is_windows then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
end

if is_macos_intel or is_macos_silicon then
	config.default_gui_startup_args = { "connect", "unix" }
end

-- Events
local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-window-title", function(_, pane)
	local cwd = pane.current_working_dir
	return cwd and basename(cwd.file_path) or nil
end)

wezterm.on("format-tab-title", function(tab)
	local cwd = tab.active_pane.current_working_dir
	return cwd and tab.tab_index + 1 .. ": " .. basename(cwd.file_path) or nil
end)

wezterm.on("gui-attached", function()
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

wezterm.on("update-right-status", function(window, pane)
	local workspace = window:active_workspace()
	local key_table = window:active_key_table()
	local leader = window:leader_is_active() and "LEADER" or nil
	local panes = pane:tab() and pane:tab():panes() or {}

	window:set_right_status(wezterm.format({
		{ Text = #panes > 1 and "(" .. #panes .. ")" .. " | " or "" },
		{ Text = leader and leader .. " | " or "" },
		{ Text = key_table and key_table .. " | " or "" },
		{ Text = workspace and wezterm.nerdfonts.oct_table .. " " .. workspace .. " workspace " or "" },
	}))
end)

-- Settings
local font = "ComicShannsMono Nerd Font Mono"
config.font = wezterm.font(font)
config.font_size = 17
config.use_fancy_tab_bar = true
config.default_workspace = "default"
config.color_scheme = "OneHalfDark"
config.unix_domains = {
	{ name = "unix" },
}
config.window_frame = {
	font = wezterm.font(font),
}

config.leader = { key = "`", timeout_milliseconds = 2000 }

config.keys = {
	-- Send LEADER to the terminal when pressing LEADER twice
	{ key = "`", mods = "LEADER", action = act.SendKey({ key = "`" }) },

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
	{ key = "d", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

	-- Zoom Pane
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

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
	{ key = "q", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },

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

	-- Maximize window
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action_callback(function(window)
			window:maximize()
		end),
	},

	-- Restore window
	{
		key = "F",
		mods = "LEADER",
		action = wezterm.action_callback(function(window)
			window:restore()
		end),
	},

	-- Font size
	{ key = "i", mods = "LEADER", action = act.ActivateKeyTable({ name = "font_size", one_shot = false }) },

	-- Disable keymaps
	{ key = "-", mods = "CTRL", action = act.DisableDefaultAssignment },
	{ key = "=", mods = "CTRL", action = act.DisableDefaultAssignment },
	{ key = "0", mods = "CTRL", action = act.DisableDefaultAssignment },
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
	font_size = {
		{ key = "h", action = act.DecreaseFontSize },
		{ key = "j", action = act.DecreaseFontSize },
		{ key = "k", action = act.IncreaseFontSize },
		{ key = "l", action = act.IncreaseFontSize },
		{ key = "i", action = act.ResetFontSize },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

config.mouse_bindings = {
	-- Bind 'Up' event of CTRL-Click to open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
	-- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.Nop,
	},
	-- Change the default click behavior so that it only selects text
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

return config
