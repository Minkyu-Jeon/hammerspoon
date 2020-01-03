
local key = require('modules.key')

hs.hotkey.bind({'cmd'}, 'f13',  function()
  hs.caffeinate.lockScreen()
end)

-- 같은 키코드인 경우 무한반복 현상이 발생한다.
key:bindUp('cmd', 'return', 'cmd', 'return', {
  ['Chrome'] = {'ctrl', 'return'}
})
































































