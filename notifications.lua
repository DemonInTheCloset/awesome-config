local awful = require 'awful'
local naughty = require 'naughty'

local audio_notify_id = nil
local brightness_notify_id = nil

local function notify_or_replace(notify_id, notify_args)
	-- Lookup Id
	local replaceme = nil
	if notify_id then
		replaceme = naughty.getById(notify_id)
	end

	if replaceme then
		-- Replace Notification
		naughty.replace_text(replaceme, notify_args.title, notify_args.text)
		return notify_id
	else
		-- Create new notification
		local notification = naughty.notify(notify_args)

		if notification then
			return notification.id
		end
	end
end

local function notify_audio()
	awful.spawn.easy_async('pamixer --get-mute --get-volume', function(stdout)
		if not stdout then
			return
		end

		-- Parse stdout
		local words = {}
		for word in stdout:gmatch '%S+' do
			table.insert(words, word)
		end
		local muted = words[1] == 'true'
		local volume = tonumber(words[2])

		-- Contruct Notification
		local args = { text = 'Volume: ' .. volume .. '%' }
		if muted or volume == 0 then
			args.text = 'Volume Muted'
		end

		audio_notify_id = notify_or_replace(audio_notify_id, args)
	end)
end

local function notify_brightness()
	awful.spawn.easy_async('xbacklight -perceived -get', function(stdout)
		if not stdout then
			return
		end

		-- Parse stdout
		local brightness = stdout:match '%d+'

		brightness_notify_id =
			notify_or_replace(brightness_notify_id, { text = 'Brightness: ' .. brightness .. '%' })
	end)
end

return {
	notify_or_replace = notify_or_replace,
	notify_audio = notify_audio,
	notify_brightness = notify_brightness,
}
