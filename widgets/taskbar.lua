local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'

-- Personal Widgets
local widget_launcher = require 'widgets/launcher'
local widget_textclock = require 'widgets/textclock'
local widgets_battery = require 'widgets/battery'
local widgets_cpu = require 'widgets/cpu'
local widget_netstatus = require 'widgets/netstatus'
local widget_volume = require 'widgets/volume'
local widget_brightness = require 'widgets/brightness'
local widget_keyboardlayout = require 'widgets/keyboardlayout'

local widgets_lain = require 'widgets/lain'

-- Lain Widgets

local bat_widget = widgets_lain.bat.widget or widgets_battery
local cpu_widget = widgets_lain.cpu.widget or widgets_cpu

local bgcol = '#282828'
local sepcol = '#3c3836'

return function(s)
	local taskbar = awful.wibar {
		position = 'top',
		screen = s,
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 4)
		end,
	}

	taskbar:setup {
		-- Add widgets to the wiboxs.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			widget_launcher,
			widgets_lain.rsep('#3c3836', '#282828'),
			s.mytaglist,
			-- widgets_lain.rsep('#282828', '#3c3836'),
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		widgets_lain.rarrows(bgcol, sepcol, { -- Right Widgets
			{ color = '#458588', widget = widget_netstatus },
			{ color = '#689d6a', widget = widget_volume },
			{ color = bgcol, widget = widget_brightness },
			{ color = '#98971a', widget = bat_widget },
			{ color = '#d65d0e', widget = cpu_widget },
			{ color = '#d65d0e', widget = widget_textclock },
			{ color = bgcol, widget = widget_keyboardlayout },
			{ color = bgcol, widget = wibox.widget.systray() },
			{ color = bgcol, widget = s.mylayoutbox },
		}, {
			layout = wibox.layout.fixed.horizontal,
		}),
	}
	return taskbar
end
