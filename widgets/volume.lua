local awful = require 'awful'

return awful.widget.watch('pamixer --get-volume pamixer --get-mute', 10, function(widget, stdout)
	local volume = stdout:match '%d+'
	local mute = stdout:match '%a+'

	if mute == 'true' or volume == '0' then
		widget:set_text('婢 ' .. volume .. '%')
	elseif volume then
		widget:set_text('墳 ' .. volume .. '%')
	end
end)
