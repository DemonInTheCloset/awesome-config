local beautiful = require 'beautiful'
local awful = require 'awful'

local mainmenu = require 'widgets/mainmenu'

return awful.widget.launcher { image = beautiful.awesome_icon, menu = mainmenu }
