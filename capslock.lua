local capslock= {"cmd", "option", "ctrl"}
-- local capslock= {"f16"}
local capslockShift = {"cmd", "option", "ctrl", "shift"}
-- local capslockShift = {"f16", "shift"}

-- reload
hs.hotkey.bind(capslock, 'r', function() 
  hs.reload()
end)

hs.hotkey.bind(capslock, 'Y', function() 
  hs.eventtap.event.newKeyEvent(nil, hs.keycodes.map.capslock, false):post()
end)

hs.hotkey.bind(capslock, 'c', nil,  function()
  hs.eventtap.keyStroke("cmd", "c")
end)

hs.hotkey.bind(capslock, 'v', nil, function()
  hs.eventtap.keyStroke("cmd", "v")
end)

hs.hotkey.bind(capslock, 'z', nil, function()
  hs.eventtap.keyStroke("cmd", "z")
end)

-- 잘라내기
hs.hotkey.bind(capslock, 'x', nil, function()
  hs.eventtap.keyStroke("cmd", "x")
end)

-- save
hs.hotkey.bind(capslock, 's', nil, function()
  hs.eventtap.keyStroke("cmd", "s")
end)

-- find
hs.hotkey.bind(capslock, 'f', nil, function()
  hs.eventtap.keyStroke("cmd", "f")
end)


-- left
hs.hotkey.bind(capslock, 'j', function()
  hs.eventtap.event.newKeyEvent({}, "left", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "left", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "left", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

hs.hotkey.bind(capslockShift, 'j', function()
  hs.eventtap.event.newKeyEvent({"shift"}, "left", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "left", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "left", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

-- right
hs.hotkey.bind(capslock, 'l', function()
  hs.eventtap.event.newKeyEvent({}, "right", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "right", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "right", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

hs.hotkey.bind(capslockShift, 'l', function()
  hs.eventtap.event.newKeyEvent({"shift"}, "right", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "right", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "right", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

-- up
hs.hotkey.bind(capslock, 'i', function()
  hs.eventtap.event.newKeyEvent({}, "up", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "up", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "up", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

hs.hotkey.bind(capslockShift, 'i', function()
  hs.eventtap.event.newKeyEvent({"shift"}, "up", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "up", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "up", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

-- down
hs.hotkey.bind(capslock, 'k', function()
  hs.eventtap.event.newKeyEvent({}, "down", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "down", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "down", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

hs.hotkey.bind(capslockShift, 'k', function()
  hs.eventtap.event.newKeyEvent({"shift"}, "down", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "down", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({"shift"}, "down", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

-- delete
hs.hotkey.bind(capslock, 'u', function()
  hs.eventtap.event.newKeyEvent({}, "delete", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "delete", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "delete", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

-- forwarddelete
hs.hotkey.bind(capslock, 'o', function()
  hs.eventtap.event.newKeyEvent({}, "forwarddelete", true):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "forwarddelete", false):post()
end, function()
  hs.eventtap.event.newKeyEvent({}, "forwarddelete", true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
end)

-- home
hs.hotkey.bind(capslock, "h", function()
  hs.eventtap.keyStroke({"cmd"}, "left")
end)

hs.hotkey.bind(capslockShift, "h", function()
  hs.eventtap.keyStroke({"cmd", "shift"}, "left")
end)

-- end
hs.hotkey.bind(capslock, ";", function()
  hs.eventtap.keyStroke({"cmd"}, "right")
end)

hs.hotkey.bind(capslockShift, ";", function()
  hs.eventtap.keyStroke({"cmd", "shift"}, "right")
end)

-- page up
hs.hotkey.bind(capslock, "n", function()
  hs.eventtap.keyStroke({}, "pageup")
end)

-- page down
hs.hotkey.bind(capslock, "m", function()
  hs.eventtap.keyStroke({}, "pagedown")
end)

-- launch finder
hs.hotkey.bind(capslock, "g", function()
  hs.application.launchOrFocus('Finder')
end)

-- launch terminal
hs.hotkey.bind(capslock, "t", function()
  hs.application.launchOrFocus('iTerm')
end)

-- launch code
hs.hotkey.bind(capslockShift, "c", function()
  local frontmostApplication = hs.application.frontmostApplication()  
  if frontmostApplication and frontmostApplication:name() == "Code" then    
    print('in code ha') 
  else
    hs.application.launchOrFocus('Visual Studio Code')
  end  
end)

