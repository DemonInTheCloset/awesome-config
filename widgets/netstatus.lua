local awful = require 'awful'

return awful.widget.watch(
	'sh -c "ip --json address show up| jq -c \'.[] | [.ifname, .operstate, .addr_info[0].local]\'"',
	10,
	function(widget, stdout)
		local interfaces = {}

		for line in stdout:gmatch '%b[]' do
			if not line:match '%b""' then
				goto continue
			end

			local ifname = line:match('%b""'):gsub('"', '')
			local state = line:match(',%b""'):gsub('[,"]', '')
			local ip = (line:match ',%b"",%b""' or ''):gsub(',%b"",', ''):gsub('"', '')

			if state == 'UP' then
				interfaces[ifname] = { state = state, ip = ip }
			elseif state == 'DOWN' then
				interfaces[ifname] = { state = state, ip = '' }
			end

			::continue::
		end

		local state = ''
		for ifname, info in pairs(interfaces) do
			ifname = ifname:sub(1, 1)
			if ifname == 'w' and info['state'] == 'DOWN' then
				state = state .. ' 睊 '
			elseif ifname == 'w' and info['state'] == 'UP' then
				state = state .. ' 直  ' .. info['ip']
			elseif ifname == 'e' and info['state'] == 'DOWN' then
				state = state .. '  '
			elseif ifname == 'e' and info['state'] == 'UP' then
				state = state .. '   ' .. info['ip']
			end
		end
		widget:set_text(state)
	end
)
