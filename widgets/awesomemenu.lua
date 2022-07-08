local awful = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'

local config = require 'config'

-- Create a launcher widget and a main menu
return {
	{
		'hotkeys',
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ 'manual', config.terminal .. ' -e man awesome' },
	{ 'edit config', config.editor_cmd .. ' ' .. awesome.conffile },
	{ 'restart', awesome.restart },
	{
		'quit',
		function()
			awesome.quit()
		end,
	},
}
