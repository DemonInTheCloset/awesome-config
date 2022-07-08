local awful = require 'awful'
local wibox = require 'wibox'
-- local gears = require("gears")
-- local naughty = require("naughty")

local widgets_lain = require 'widgets/lain'

-- local function table_keys(table)
-- 	local s = ""
-- 	for key, _ in pairs(table) do
-- 		s = s .. key .. "\n"
-- 	end
-- 	return s
-- end

return function(screen, buttons)
	return awful.widget.tasklist {
		screen = screen,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = buttons,
		widget_template = {
			{
				{
					{
						widget = widgets_lain.rsep('#282828', 'alpha'),
					},
					{
						{
							{
								id = 'icon_role',
								widget = wibox.widget.imagebox,
							},
							margins = 2,
							widget = wibox.container.margin,
						},
						{
							id = 'text_role',
							widget = wibox.widget.textbox,
						},
						layout = wibox.layout.fixed.horizontal,
					},
					{
						widget = widgets_lain.rsep('alpha', '#282828'),
					},
					layout = wibox.layout.align.horizontal,
				},
				widget = wibox.container.margin,
			},
			id = 'background_role',
			widget = wibox.container.background,
		},
	}
end
