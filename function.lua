local const = require('modules.const')
local key = require('modules.key')

local capslock = const.key.capslock
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

-- key:bindDown(nil, 'F2', nil, 'F2', {
--   ['PyCharm'] = {'shift', 'F6'},
--   ['Code'] = {'cmd', 'F2'},
-- })

-- key:bindDown(nil, 'F3', nil, 'F3', {
--   ['Chrome'] = {nil, 'pageup'},
-- })

-- set up your instance(s)
-- expose = hs.expose.new(nil,{showThumbnails=false}) -- default windowfilter, no thumbnails
-- expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
-- expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
-- expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
-- for your dozens of browser windows :)

-- then bind to a hotkey
-- hs.hotkey.bind(nil, 'F3', 'App Expose',function()
--     -- print('f3')
--     -- expose_space:toggleShow()
--     hs.osascript.applescript("tell application \"System Events\" to key code 123 using control down")
-- end)
-- hs.hotkey.bind('ctrl-cmd-shift','e','App Expose',function()expose_app:toggleShow()end)
-- key:bindDown(nil, 'F3', 
--     function()
--         print('f3')
--     end)
-- hs.hotkey.bind(nil, "F3", function()
--     print('f3')
-- end)

-- key:bindDown(nil, 'F4', nil, 'F4', {
--     ['Chrome'] = {nil, 'pagedown'},
--     ['Code'] = {nil, 'F12'},
--     ['PyCharm'] = {'cmd', 'b'},
--     ['Android Studio'] = {'cmd', 'b'}
-- })

key:bindDown(nil, 'F5', nil, 'F5', {
    ['PyCharm'] = {'ctrl', 'd'}, -- debug run
    ['Google Chrome'] = {'cmd', 'r'},
    ['Firefox'] = {'cmd', 'r'},
    ['Code'] = {nil, 'F5'},
    ['iTerm2'] = {'ctrl', 'f'},
    ['IntelliJ IDEA'] = {{'cmd', 'shift'}, 'p'},
})

key:bindDown(nil, 'F6', nil, 'F6', {
    ['PyCharm'] = {'ctrl', 'r'}, -- run
    ['iTerm2'] = {'ctrl', 'r'}
})

key:bindDown(nil, 'F7', nil, 'F7', {
    ['iTerm2'] = {'ctrl', 's'}
})

key:bindDown(nil, 'F9', nil, 'F9', {
    ['PyCharm'] = {{'option', 'cmd'}, 'r'},
    ['Android Studio'] = {{'option', 'cmd'}, 'r'}
})

-----------------------------------------
-- Capslock function keys
-----------------------------------------
key:bindDown(capslock, 'F6', capslock, 'F6', {
    ['PyCharm'] = {'shift', 'F6'},
    ['Android Studio'] = {'shift', 'F6'}
})

key:bindDown(capslock, "F9", capslock, 'F9', {
    ['Android Studio'] = {{'option', 'cmd'}, 'r'}
})

-- hs.hotkey.bind('cmd', "F10", nil, function()  
--   for i=1, 10 do -- 기본 증가치는 1이 된다
--     hs.eventtap.keyStroke(nil, "end")      
--     hs.eventtap.keyStroke(nil, ",")      
--     hs.eventtap.keyStroke(nil, "down")     
--   end 
-- end)

hs.hotkey.bind(capslock, "F10", function()
    hs.audiodevice.defaultOutputDevice():setVolume(0)
end)

hs.hotkey.bind(capslock, "F11", function()
    volumeChange(false)
end)

hs.hotkey.bind(capslock, "F12", function()
    volumeChange(true)
end)

key:bindDown(nil, 'end', 'cmd', 'right', {})
key:bindDown('shift', 'end', {'cmd', 'shift'}, 'right', {})
key:bindDown(nil, 'home', 'cmd', 'left', {})
key:bindDown('shift', 'home', {'cmd', 'shift'}, 'left', {})

view = hs.webview.new({
    x = 10,
    y = 10,
    w = 150,
    h = 100
})
view:windowStyle("closable")
view:windowStyle("titled")
view:windowStyle("resizable")
view:url('file:///' .. os.getenv("HOME") .. '/test/menu.html')

hs.hotkey.bind("shift", "f4", function()
    local email = 'test@email.com'
    hs.messages.SMS(email, "Test iMessage")
end)

