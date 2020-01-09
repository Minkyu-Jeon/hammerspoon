
local const = require('modules.const')
local capslock= const.key.capslock
local capslockCmd = const.key.capslockCmd
local capslockShift = const.key.capslockShift


require('modules.inputsource_aurora')
require('modules.caffein'):init(capslockShift, 'p')

require('capslock')
require('command')
require('function')
require('symbol')
require('wifi')
require('text')


-- Spoons
local ClipboardTool = hs.loadSpoon("ClipboardTool")
ClipboardTool:start()
hs.hotkey.bind(capslock, 'p', function() 
  ClipboardTool:toggleClipboard()
end)

local aclock = hs.loadSpoon('AClock')
hs.hotkey.bind(capslock, "0", function()
  aclock:toggleShow()
end)          

hs.hotkey.bind(capslock, '\'', function()
  expose = hs.expose.new(nil,{showThumbnails=true, includeOtherSpaces=true}) 
  expose:toggleShow()
end)

-- Make the alerts look nicer.
hs.alert.defaultStyle.strokeColor =  {white = 1, alpha = 0}
hs.alert.defaultStyle.fillColor =  {white = 0.05, alpha = 0.55}
hs.alert.defaultStyle.radius =  10



function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated) then
      if (appName == "Finder") then
        print(appName)
          -- Bring all Finder windows forward when one gets activated
          -- appObject:selectMenuItem({"Window", "Bring All to Front"})
          appObject:selectMenuItem({"윈도우", "모두 앞으로 가져오기"})
      end
  end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

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

