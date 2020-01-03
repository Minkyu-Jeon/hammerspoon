
local key = require('modules.key')

--hs.caffeinate.lockScreen()

hs.hotkey.bind({'cmd'}, 'f13',  function() 
  print('lock screen')
  hs.caffeinate.lockScreen()
end)

key:bindUp({'cmd'}, 'return', {'cmd'}, 'return', {
  ['Chrome'] = {'ctrl', 'return'}
})

































