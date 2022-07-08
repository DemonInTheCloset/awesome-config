local lain = require 'lain'
local wibox = require 'wibox'

local lsep = lain.util.separators.arrow_left
local rsep = lain.util.separators.arrow_right

local function arrows(bgcol, sepcol, widgets, output, arrow)
	for i, val in ipairs(widgets) do
		local lcolor = (widgets[i - 1] or { color = bgcol }).color
		output[3 * i - 2] = arrow(lcolor, sepcol)
		output[3 * i - 1] = arrow(sepcol, val.color)
		output[3 * i] = wibox.container.background(val.widget, val.color)
	end

	return output
end

return {
	lsep = lsep,
	rsep = rsep,
	arrows = arrows,
	larrows = function(bgcol, sepcol, widgets, output)
		return arrows(bgcol, sepcol, widgets, output, lsep)
	end,
	rarrows = function(bgcol, sepcol, widgets, output)
		return arrows(bgcol, sepcol, widgets, output, rsep)
	end,
	bat = lain.widget.bat {
		settings = function()
			if bat_now.status == 'N/A' then
				return
			end
			local status = ''
			if bat_now.status == 'Discharging' then
				status = ''
			elseif bat_now.status == 'Charging' then
				status = ''
			elseif bat_now.status == 'Not Charging' or bat_now.status == 'Full' then
				status = ''
			end

			widget:set_markup(status .. ': ' .. bat_now.perc .. '% ')
		end,
	},
	cpu = lain.widget.cpu {
		settings = function()
			widget:set_markup('CPU: ' .. cpu_now.usage .. '%')
		end,
	},
}
