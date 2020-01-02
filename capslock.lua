local const = require('modules.const')

local capslock= const.key.capslock
local capslockShift = const.key.capslockShift

-- reload
hs.hotkey.bind(capslock, 'r', function() 
  hs.reload()  
end)
hs.alert.show("HS reloaded")

hs.hotkey.bind(capslock, 'y', function() 
  hs.eventtap.event.newKeyEvent(nil, hs.keycodes.map.capslock, true):post()
end)

function keybindUp(mod, key, strokeMod, strokeKey)
  hs.hotkey.bind(mod, key, nil, function()
    hs.eventtap.keyStroke(strokeMod, strokeKey)
  end)
end

keybindUp(capslock, 'c', 'cmd', 'c')
keybindUp(capslock, 'v', 'cmd', 'v')
keybindUp(capslock, 'z', 'cmd', 'z')
keybindUp(capslock, 'x', 'cmd', 'x')
keybindUp(capslock, 's', 'cmd', 's')
keybindUp(capslock, 'f', 'cmd', 'f')

function keybindDown(mod, key, strokeMod, strokeKey)
  hs.hotkey.bind(mod, key, function()
    hs.eventtap.keyStroke(strokeMod, strokeKey)
  end)
end

keybindDown(capslock, 'h', 'cmd', 'left')
keybindDown(capslockShift, 'h', {"cmd", "shift"}, 'left')
keybindDown(capslock, ';', 'cmd', 'right')
keybindDown(capslockShift, ';', {"cmd", "shift"}, 'right')
keybindDown(capslock, 'n', {}, 'pageup')
keybindDown(capslock, 'm', {}, 'pagedown')
keybindDown(capslock, '1', {}, 'F1')
keybindDown(capslock, '2', {}, 'F2')

hs.hotkey.bind(capslock, "]", nil, function()
  local frontmostApplication = hs.application.frontmostApplication()    

  if frontmostApplication and frontmostApplication:name() == 'Code' then        
    hs.eventtap.keyStroke('ctrl', "-")  
  else    
    hs.eventtap.keyStroke('cmd', "]")  
  end  
end)
      
hs.hotkey.bind(capslock, "[", nil, function()
  local frontmostApplication = hs.application.frontmostApplication()  
  
  if frontmostApplication and frontmostApplication:name() == 'Code' then      
    hs.eventtap.keyStroke({'ctrl', 'shift'}, "-")  
  else    
    hs.eventtap.keyStroke('cmd', "[")
  end  
end)
  

function keyScript(mod, key, script)  
  hs.hotkey.bind(mod, key, function()    
    hs.osascript.applescript(script)   
    -- hs.osascript.applescript("tell application \"System Events\" to key code 123 using control down")        
    -- hs.osascript.applescript("tell application \"Mission Control\" to launch")    
  end)
end

keyScript(capslock, '3', 'tell application "Mission Control" to launch')


function keyEvent(mod, key, strokeMod, strokeKey)
  hs.hotkey.bind(mod, key, function()
    hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):post()
  end, function()
    hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, false):post()
  end, function()
    hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
  end)
end

keyEvent(capslock, 'j', {}, 'left')
keyEvent(capslockShift, 'j', {'shift'}, 'left')

keyEvent(capslock, 'l', {}, 'right')
keyEvent(capslockShift, 'l', {'shift'}, 'right')

keyEvent(capslock, 'i', {}, 'up')
keyEvent(capslockShift, 'i', {'shift'}, 'up')

keyEvent(capslock, 'k', {}, 'down')
keyEvent(capslockShift, 'k', {'shift'}, 'down')

keyEvent(capslock, 'u', {}, 'delete')
keyEvent(capslock, 'o', {}, 'forwarddelete')

function launchApp(mod, key, app)
  hs.hotkey.bind(mod, key, function()    
    hs.application.launchOrFocus(app)
  end)
end

launchApp(capslock, 'g', const.app.finder)
launchApp(capslock, 't', const.app.iTerm)
launchApp(capslockShift, 'c', const.app.visualStudioCode)
launchApp(capslockShift, 's', const.app.slack)
launchApp(capslockShift, 'w', const.app.chrome)


local aclock = hs.loadSpoon('AClock')

hs.hotkey.bind(capslockShift, "t", function()
  aclock:toggleShow()
end)



-- 한영변환
local inputSource = {
  english = "com.apple.keylayout.ABC",
  korean = "com.apple.inputmethod.Korean.2SetKorean",
}

local changeInput = function()
  local current = hs.keycodes.currentSourceID()
  local nextInput = nil

  if current == inputSource.english then
      nextInput = inputSource.korean
  else
      nextInput = inputSource.english
  end
  hs.keycodes.currentSourceID(nextInput)
end

hs.hotkey.bind(capslock, 'space', changeInput)

-- intelligence
hs.hotkey.bind(capslock, ".", function()
  local frontmostApplication = hs.application.frontmostApplication()  
  if frontmostApplication and frontmostApplication:name() == const.app.androidStudio then    
    hs.eventtap.keyStroke({'alt'}, "return")  
  end  
end)


hs.hotkey.bind(capslock, "6", function()
  local frontmostApplication = hs.application.frontmostApplication()  
  if frontmostApplication and frontmostApplication:name() == "Android Studio" then    
    -- rename
    hs.eventtap.keyStroke({}, "F6")  
  end  
end)




-- default windowfilter, no thumbnails

hs.hotkey.bind(capslockShift, 'o', function()
  expose = hs.expose.new(nil,{showThumbnails=true, includeOtherSpaces=false}) 
  expose:toggleShow()
end)


local ClipboardTool = hs.loadSpoon("ClipboardTool")
ClipboardTool:start()
hs.hotkey.bind(capslock, 'p', function() 
    ClipboardTool:toggleClipboard()
end)
                


function move_window(direction)
  return function()
      local win      = hs.window.focusedWindow()
      local app      = win:application()
      local app_name = app:name()
      local f        = win:frame()
      local screen   = win:screen()
      local max      = screen:frame()
      if direction == "left" then
          f.x = max.x
          f.w = (max.w / 2)
      elseif direction == "right" then
          f.x = (max.x + (max.w / 2))
          f.w = (max.w / 2)
      elseif direction == "up" then
          f.x = max.x
          f.w = max.w
      elseif direction == "down" then
          f.x = (max.x + (max.w / 8))
          f.w = (max.w * 3 / 4)
      end
      f.y = max.y
      f.h = max.h
      win:setFrame(f, 0.0)
  end
end

hs.hotkey.bind(capslock, "Left", move_window("left"))
hs.hotkey.bind(capslock, "Right", move_window("right"))
hs.hotkey.bind(capslock, "Up", move_window("up"))
hs.hotkey.bind(capslock, "Down", move_window("down"))



-- local ksheet = hs.loadSpoon('KSheet')
-- hs.hotkey.bind(capslock, 'k', function()
--   isSheetOpend = !isSheetOpend
--   if isSheetOpend then
--   ksheet:show()
-- end)