-- change layout
-- hs.hotkey.bind({}, "f13", function()
--   hs.eventtap.keyStroke({"ctrl", "option"}, "space")
--   local lay = hs.keycodes.currentLayout()
--   print(lay)
--   if lay == "ABC" then
--     -- hs.keycodes.setLayout("2-Set Korean")
--     hs.keycodes.setMethod("2-Set Korean")
--   else
--     hs.keycodes.setLayout("ABC")
--   end
-- end)
local const = require('modules.const')

local capslock= const.key.capslock
local capslockShift = const.key.capslockShift

local inputSource = {
  english = "com.apple.keylayout.ABC",
  korean = "com.apple.inputmethod.Korean.2SetKorean",
}

-- 한영변환
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

hs.hotkey.bind(nil, 'f13', changeInput)


function volumeChange(isIncrement)
  local volume = hs.audiodevice.current().volume
  print(volume)  
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

-- hs.alert.show(tostring(newVolume))
  hs.alert.show(tonumber(string.format("%.1f", newVolume)))
  hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
end

hs.hotkey.bind(capslock, "f10", function()  
  hs.audiodevice.defaultOutputDevice():setVolume(0)
end)

hs.hotkey.bind(capslock, "f11", function()
  volumeChange(false)
end)

hs.hotkey.bind(capslock, "f12", function()
  volumeChange(true)
end)


hs.hotkey.bind(capslock, 'f6', function()
  local frontmostApplication = hs.application.frontmostApplication()  
  if frontmostApplication and frontmostApplication:name() == "PyCharm" then        
    hs.eventtap.keyStroke({"shift"}, "F6")  
  else
    hs.eventtap.keyStroke(mod, key)  
  end
end)