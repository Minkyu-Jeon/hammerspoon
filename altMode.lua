local const = require('modules.const')
local key = require('modules.key')
local capslock = const.key.capslock

local altMode = hs.hotkey.modal.new()

hs.hotkey.bind(capslock, 'tab', function()
    hs.alert.show('altMode:enter()')
    altMode:enter()
end)

altMode:bind(nil, 'tab', function()
    hs.alert.show('altMode:exit()')
    altMode:exit()
end)

altMode:bind(nil, 'escape', function()
    hs.alert.show('altMode:exit()')
    altMode:exit()
end)

altMode:bind(nil, 'e', function()
    hs.eventtap.keyStroke(nil, 'up')
end)

altMode:bind(nil, 'd', function()
    hs.eventtap.keyStroke(nil, 'down')
end)

altMode:bind(nil, 's', function()
    hs.eventtap.keyStroke(nil, 'left')
end)

altMode:bind(nil, 'f', function()
    hs.eventtap.keyStroke(nil, 'right')
end)

altMode:bind(nil, 'c', function()
    hs.eventtap.keyStroke(nil, 'pagedown')
    -- hs.eventtap.event.newScrollEvent({0, -3}, {}, "pixel")
end)

altMode:bind(nil, 'v', function()
    hs.eventtap.keyStroke(nil, 'pageup')
end)

-- altMode:bind({}, '1', function()
--     hs.alert.show('test 1')
-- end)
-- altMode:bind({}, '2', function()
--     hs.alert.show('test 2')
-- end)

