local const = hs.loadSpoon('const')

local capslock= {"cmd", "option", "ctrl"}
local capslockShift = {"cmd", "option", "ctrl", "shift"}

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

keybindDown(capslock, ']', 'cmd', ']')
keybindDown(capslock, '[', 'cmd', '[')


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

launchApp(capslock, 'g', 'Finder')
launchApp(capslock, 't', 'iTerm')
launchApp(capslockShift, 'c', const.app.visualStudioCode)


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

