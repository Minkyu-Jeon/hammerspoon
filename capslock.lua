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

hs.hotkey.bind(capslock, 'y', function() 
  hs.eventtap.event.newKeyEvent(nil, hs.keycodes.map.capslock, true):post()
end)

key:bindUp(capslock, 'c', 'cmd', 'c')
key:bindUp(capslock, 'v', 'cmd', 'v')
key:bindUp(capslock, 'z', 'cmd', 'z')
key:bindUp(capslock, 'x', 'cmd', 'x')
key:bindUp(capslock, 's', 'cmd', 's')
key:bindUp(capslock, 'f', 'cmd', 'f')

key:bindDown(capslock, 'h', 'cmd', 'left')
key:bindDown(capslockShift, 'h', {"cmd", "shift"}, 'left')
key:bindDown(capslock, ';', 'cmd', 'right')
key:bindDown(capslockShift, ';', {"cmd", "shift"}, 'right')
key:bindDown(capslock, 'n', {}, 'pageup')
key:bindDown(capslockShift, 'n', {"shift"}, 'pageup')
key:bindDown(capslock, 'm', {}, 'pagedown')
key:bindDown(capslockShift, 'm', {"shift"}, 'pagedown')

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
key:event(capslock, 'o', {}, 'forwarddelete')

app:launch(capslock, 'g', const.app.finder)
app:launch(capslock, 't', const.app.iTerm)
app:launch(capslockShift, 'c', const.app.visualStudioCode)
app:launch(capslockShift, 's', const.app.slack)
app:launch(capslockShift, 'w', const.app.chrome)

key:bindDown(capslock, 'space', nil, 'F13')  -- 한영전환

key:bindDown(capslock, '.', capslock, '.', {
  ['Pycharm'] = {"option", "return"},
  ['Android Studio'] = {"option", 'return'},
  ['Chrome'] = {'---->'},
  ['Code'] = {"cmd", "."},
})

key:bindDown(capslock, '/', capslock, '/', {
  ['Chrome'] = {'---->>'},
})

key:bindDown(capslock, '4', capslock, '4', {
  ['Code'] = { '$$ $$' },
})

key:bindDown(capslock, '6', capslock, '6', {
  ['Android Studio'] = { nil, 'F6'}
})
    
hs.hotkey.bind(capslock, "Left", window:move("left"))
hs.hotkey.bind(capslock, "Right", window:move("right"))
hs.hotkey.bind(capslock, "Up", window:move("up"))
hs.hotkey.bind(capslock, "Down", window:move("down"))