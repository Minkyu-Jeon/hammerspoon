local const = require('modules.const')
local capslock = const.key.capslock

local altMode = hs.hotkey.modal.new()

hs.hotkey.bind(capslock, 'tab', function() altMode:enter() end)
altMode:bind(nil, 'tab', function() altMode:exit() end)

altMode:bind({}, '1', function() hs.alert.show('test 1') end)
altMode:bind({}, '2', function() hs.alert.show('test 2') end)



