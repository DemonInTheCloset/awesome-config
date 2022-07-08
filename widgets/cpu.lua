local awful = require 'awful'
local vicious = require 'vicious'

local cpu = awful.widget.graph()
cpu:set_width(50)
cpu:set_background_color '#3c3836'
cpu:set_color {
	type = 'linear',
	from = { 0, 0 },
	to = { 50, 0 },
	stops = {
		{ 0, '#fb4934' },
		{ 0.5, '#83c07c' },
		{ 1, '#689d6a' },
	},
}
vicious.cache(vicious.widgets.cpu)
vicious.register(cpu, vicious.widgets.cpu, '$1', 1)

return cpu
