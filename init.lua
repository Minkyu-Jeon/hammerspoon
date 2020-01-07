
local const = require('modules.const')
local capslock= const.key.capslock
local capslockCmd = const.key.capslockCmd
local capslockShift = const.key.capslockShift

-- key bind
require('capslock')
require('command')
require('function')
require('text')
require('symbol')
require('modules.inputsource_aurora')
require('modules.caffein'):init(capslockCmd, 'p')

-- watcher
local wifiWatcher = require('wifi')


-- Spoons
local ClipboardTool = hs.loadSpoon("ClipboardTool")
ClipboardTool:start()
hs.hotkey.bind(capslock, 'p', function() 
  ClipboardTool:toggleClipboard()
end)

local aclock = hs.loadSpoon('AClock')
hs.hotkey.bind(capslockShift, "t", function()
  aclock:toggleShow()
end)          

hs.hotkey.bind(capslockShift, 'p', function()
  expose = hs.expose.new(nil,{showThumbnails=true, includeOtherSpaces=true}) 
  expose:toggleShow()
end)

hs.hotkey.bind(capslock, '\'', function()
  expose = hs.expose.new(nil,{showThumbnails=true, includeOtherSpaces=true}) 
  expose:toggleShow()
end)

-- Make the alerts look nicer.
hs.alert.defaultStyle.strokeColor =  {white = 1, alpha = 0}
hs.alert.defaultStyle.fillColor =  {white = 0.05, alpha = 0.55}
hs.alert.defaultStyle.radius =  10




-- Make the console dark
--hs.console.darkMode(false)


-- hs.loadSpoon("ModalMgr")
-- hs.loadSpoon("AClock")




-- Register AClock
-- if spoon.AClock then
--     -- hsaclock_keys = hsaclock_keys or {{"cmd", "shift"}, "T"}    
--     hsaclock_keys = {"cmd", "t"}
--     if string.len(hsaclock_keys[2]) > 0 then        
--         spoon.ModalMgr.supervisor:bind(hsaclock_keys[1], hsaclock_keys[2], "Toggle Floating Clock", function() spoon.AClock:toggleShow() end)        
--     end
-- end

