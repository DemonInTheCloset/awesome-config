local awful = require 'awful'

return awful.widget.watch('wpctl get-volume @DEFAULT_AUDIO_SINK@', 10, function(widget, stdout)
	local volume = stdout:match '%d.%d+'
	local mute = stdout:match 'MUTED'

	if mute == 'MUTED' or volume == '0.00' then
		widget:set_text('婢 ' .. volume)
	elseif volume then
		widget:set_text('墳 ' .. volume)
	end
end)
