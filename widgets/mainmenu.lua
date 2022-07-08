local awful = require 'awful'
local beautiful = require 'beautiful'

local config = require 'config'
local awesomemenu = require 'widgets/awesomemenu'

return awful.menu {
	items = {
		{ 'awesome', awesomemenu, beautiful.awesome_icon },
		{ 'open terminal', config.terminal },
	},
}
