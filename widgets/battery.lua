local beautiful = require 'beautiful'
local vicious = require 'vicious'
local gears = require 'gears'
local wibox = require 'wibox'

local batbar = wibox.widget.progressbar()
local battext = wibox.widget.textbox()

local batbox = wibox.layout.margin(
	wibox.widget {
		{
			max_value = 1,
			widget = batbar,
			shape = gears.shape.rounded_bar,
			border_width = 0.5,
			border_color = '#3c3836',
			color = {
				type = 'linear',
				from = { 0, 0 },
				to = { 0, 30 },
				stops = { { 0, '#98971a' }, { 0.5, '#689d6a' }, { 1, '#cc241d' } },
			},
		},
		{
			widget = battext,
			align = 'center',
		},
		forced_height = 8,
		forced_width = 28,
		direction = 'east',
		color = beautiful.fg_widget,
		layout = wibox.layout.stack,
	},
	1,
	1,
	2,
	2
)

vicious.register(batbar, vicious.widgets.bat, '$2', 61, 'BAT0')
vicious.register(battext, vicious.widgets.bat, '$2%', 61, 'BAT0')

return batbox
