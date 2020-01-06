
local const = require('modules.const')
local key = require('modules.key')

local capslock= const.key.capslock
local capslockShift = const.key.capslockShift

function volumeChange(isIncrement)
  local volume = hs.audiodevice.current().volume  
  -- When the volume gets near zero, change it in smaller increments. Otherwise even the first increment
  -- above zero may be too loud.
  -- NOTE(phil): I noticed that using a decimal smaller than 0.4 will sometimes result in the volume remaining
  -- unchanged after calling setVolume, as if OSX only lets you change the volume by large increments.
  local diff = 2

  if volume < 2 then 
    diff = 0.4
  elseif volume > 50 then
    diff = 16
  elseif volume > 10 then
    diff = 4  
  end
    
  if isIncrement == true then
    newVolume = volume + diff
  else
    newVolume = volume - diff
  end

  if newVolume > 100 then
    newVolume = 100
  elseif newVolume < 0 then
    newVolume = 0
  end

  hs.alert.show(tonumber(string.format("%.1f", newVolume)))
  hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
end

-----------------------------------------
-- Defalut function keys
-----------------------------------------


key:bindDown(nil, 'F2', nil, 'F2', {
  ['PyCharm'] = {'shift', 'F6'},
  ['Code'] = {'cmd', 'F2'},
})

key:bindDown(nil, 'F3', nil, 'F3', {
  ['Chrome'] = {nil, 'pageup'},
})

key:bindDown(nil, 'F4', nil, 'F4', {
  ['Chrome'] = {nil, 'pagedown'},
  ['Code'] = {nil, 'F12'},
  ['PyCharm'] = {'cmd', 'b'},
})

key:bindDown(nil, 'F5', nil, 'F5', {
  ['PyCharm'] = {'ctrl', 'd'}, -- debug run
  ['Chrome'] = {'cmd', 'r'},
})

key:bindDown(nil, 'F6', nil, 'F6', {
  ['PyCharm'] = {'ctrl', 'r'}, -- run
})

key:bindDown(nil, 'F9', nil, 'F9', {
  ['PyCharm'] = {{'option', 'cmd'}, 'r'},
})


-----------------------------------------
-- Capslock function keys
-----------------------------------------
key:bindDown(capslock, 'F6', capslock, 'F6', {
  ['PyCharm'] = {'shift', 'F6'}
})

hs.hotkey.bind(capslock, "f10", function()  
  hs.audiodevice.defaultOutputDevice():setVolume(0)
end)

hs.hotkey.bind(capslock, "f11", function()
  volumeChange(false)
end)

hs.hotkey.bind(capslock, "f12", function()
  volumeChange(true)
end)

key:bindDown(nil, 'end', 'cmd', 'right', {})
key:bindDown(nil, 'home', 'cmd', 'left', {})