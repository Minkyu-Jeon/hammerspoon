local const = require('modules.const')
local key = require('modules.key')
local window = require('modules.window')
local app = require('modules.app')

local capslock = const.key.capslock
local capslockCmd = const.key.capslockCmd
local capslockShift = const.key.capslockShift
local capslockCmdShift = const.key.capslockCmdShift

-- reload
hs.hotkey.bind(capslock, 'r', function() 
  hs.reload()  
end)
hs.alert.show("HS reloaded")

-- TODO: 캡스락 키 제어
hs.hotkey.bind(capslock, 'y', function() 
  hs.eventtap.event.newKeyEvent(nil, hs.keycodes.map.capslock, true):post()
end)

app:launch(capslock, 'g', const.app.finder)
app:launch(capslock, 't', const.app.iTerm)
app:launch(capslock, 'w', 'Google Chrome')
app:launch(capslockShift, 'a', 'Android Studio')
app:launch(capslockShift, 'c', 'Visual Studio Code')
app:launch(capslockShift, 's', 'Slack')

key:bindUp(capslock, 'a', 'cmd', 'a')
key:bindUp(capslock, 'c', 'cmd', 'c')
key:bindUp(capslock, 'v', 'cmd', 'v')
key:bindUp(capslock, 'z', 'cmd', 'z')
key:bindUp(capslock, 'x', 'cmd', 'x')
key:bindUp(capslock, 's', 'cmd', 's')
key:bindUp(capslock, 'f', 'cmd', 'f')

-- 클립보드에서 앞 공백제거 후 붙여넣기
key:bindUp(capslockShift, 'v', function() 
  clipboard = hs.pasteboard.getContents()
  
  minLen = string.len(clipboard)
  isFirst = true
  exceptFirst = false

  for t in clipboard:gmatch("[^\r\n]+") do
    w, s = string.match(t, "(%s*)(.*)")
    wLen = string.len(w)
    sLen = string.len(s)

    if sLen ~= 0 then
      if isFirst == true then
        isFirst = false
        if wLen == 0 then
          exceptFirst = true        
        elseif wLen < minLen then
            minLen = wLen
        end     
      else
        if wLen < minLen then
          minLen = wLen
        end    
      end
    end
  end

  newText = ""
  isFirst = true
  for t in clipboard:gmatch("[^\r\n]+") do
    if isFirst == true and exceptFirst == true then
      newText = t .. '\r'
      isFirst = false
    else
      r = string.sub(t, minLen + 1, string.len(t))
      print(":" .. r .. ":")
      newText = newText .. r ..'\r'
    end
  end
  
  result = string.sub(newText, 1, string.len(newText))
  hs.pasteboard.setContents(result)
  hs.eventtap.keyStroke('cmd', 'v')
end) 


key:bindDown(capslock, 'h', 'cmd', 'left')
key:bindDown(capslockShift, 'h', {"cmd", "shift"}, 'left')
key:bindDown(capslock, ';', 'cmd', 'right')
key:bindDown(capslockShift, ';', {"cmd", "shift"}, 'right')
key:bindDown(capslock, 'm', {}, 'pageup')
key:bindDown(capslockShift, 'm', {"shift"}, 'pageup')
key:bindDown(capslock, ',', {}, 'pagedown')
key:bindDown(capslockShift, ',', {"shift"}, 'pagedown')

key:bindDown(capslock, '1', {}, 'F1')
key:bindDown(capslock, '2', {}, 'F2')
key:appleScript(capslock, '3', 'tell application "Mission Control" to launch')

key:bindUp(capslock, '[', 'cmd', '[', {
  ['Code'] = {{'ctrl', 'shift'}, '-'}
})
key:bindUp(capslock, ']', 'cmd', ']', {
  ['Code'] = {{'ctrl'}, '-'}
})

key:event(capslock, 'j', {}, 'left')
key:event(capslockCmd, 'j', {'option'}, 'left')
key:event(capslockShift, 'j', {'shift'}, 'left')
key:event(capslockCmdShift, 'j', {'option', 'shift'}, 'left')

key:event(capslock, 'l', {}, 'right')
key:event(capslockCmd, 'l', {'option'}, 'right')
key:event(capslockShift, 'l', {'shift'}, 'right')
key:event(capslockCmdShift, 'l', {'option', 'shift'}, 'right')

key:event(capslock, 'i', {}, 'up')
key:event(capslockCmd, 'i', {'option'}, 'up')
key:event(capslockShift, 'i', {'shift'}, 'up')
key:event(capslockCmdShift, 'l', {'option', 'shift'}, 'up')

key:event(capslock, 'k', {}, 'down')
key:event(capslockCmd, 'k', {'option'}, 'down')
key:event(capslockShift, 'k', {'shift'}, 'down')
key:event(capslockCmdShift, 'k', {'option', 'shift'}, 'down')

key:event(capslock, 'u', {}, 'delete')
key:bindUp(capslockCmd, 'u', function()   
  hs.eventtap.keyStroke({'shift', 'option'}, 'left')
  hs.eventtap.keyStroke(nil, 'delete')
end)
key:event(capslock, 'o', {}, 'forwarddelete')
key:bindUp(capslockCmd, 'o', function()   
  hs.eventtap.keyStroke({'shift', 'option'}, 'right')
  hs.eventtap.keyStroke(nil, 'delete')
end)

key:event(capslock, 'q', {}, 'delete')
key:event(capslock, 'e', {}, 'forwarddelete')


key:bindDown(capslock, 'b', capslock, 'b', {
  ['Code'] = { nil, "F12"}, -- follow
  ['PyCharm'] = {nil, 'F3'},  -- toggle bookmark
})

key:bindDown(capslock, 'delete', function() 
  hs.eventtap.keyStroke('cmd', 'right')
  hs.eventtap.keyStroke({'shift', 'cmd'}, 'left')
  hs.eventtap.keyStroke(nil, 'delete')
end) 

key:bindDown(capslock, 'space', nil, 'F13')  -- 한영전환

key:bindUp(capslock, '.', capslock, '.', {
  ['PyCharm'] = {"option", "return"},
  ['Android Studio'] = {"option", 'return'},
  ['Chrome'] = {'---->'},
  ['Code'] = {"cmd", "."},
})

key:bindDown(capslock, '/', capslock, '/', {
  ['Chrome'] = {'---->>'},
})

key:bindDown(capslock, '0', capslock, '0', {
  ['PyCharm'] = {'cmd', 'F3'},  -- show bookmark list
})


key:bindDown(capslock, '2', capslock, '2', {
  ['Code'] = {'cmd', 'F2'},
  ['PyCharm'] = {'shift', 'F6'},  
  ['Chrome'] = {nil, 'return'},  
})

key:bindDown(capslock, '3', capslock, '3', {  
  ['PyCharm'] = {nil, 'F2'},  
})

key:bindDown(capslock, '4', capslock, '4', {
  ['Code'] = { '$$ $$' },
})

key:bindDown(capslock, '6', capslock, '6', {
  ['Android Studio'] = { nil, 'F6'}
})

key:bindDown(capslock, '-', capslock, '-', {
  ['PyCharm'] = {'shift', 'F2'},  -- show bookmark list
  ['Chrome'] = {{'ctrl', 'shift'}, 'tab'},
})

key:bindDown(capslock, '=', capslock, '=', {
  ['PyCharm'] = {nil, 'F2'},  -- show bookmark list
  ['Chrome'] = {{'ctrl'}, 'tab'},
})

    
hs.hotkey.bind(capslock, "Left", window:move("left"))
hs.hotkey.bind(capslock, "Right", window:move("right"))
hs.hotkey.bind(capslock, "Up", window:move("up"))
hs.hotkey.bind(capslock, "Down", window:move("down"))

