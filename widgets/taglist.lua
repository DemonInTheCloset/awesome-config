local awful = require 'awful'
local wibox = require 'wibox'

local widgets_lain = require 'widgets/lain'

return function(s, taglist_buttons)
	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		widget_template = {
			{
				{
					widget = widgets_lain.rsep('#282828', 'alpha'),
				},
				{
					{
						id = 'text_role',
						widget = wibox.widget.textbox,
					},
					left = 1,
					right = 1,
					widget = wibox.container.margin,
				},
				{
					widget = widgets_lain.rsep('alpha', '#282828'),
				},
				layout = wibox.layout.align.horizontal,
			},
			id = 'background_role',
			widget = wibox.container.background,
		},
		buttons = taglist_buttons,
	}
end
