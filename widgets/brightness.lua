local awful = require 'awful'

return awful.widget.watch('xbacklight -perceived -get', 10, function(widget, stdout, stderr)
	-- No backlight
	if stderr and stderr ~= '' then
		widget:set_text ''
		return
	end

	widget:set_text(' ' .. stdout:match '%d+' .. '%')
end)
