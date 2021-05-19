
local key = require('modules.key')

hs.hotkey.bind({'cmd'}, 'f13',  function()
  hs.caffeinate.lockScreen()
end)


key:bindUp('cmd', 'return', 'cmd', 'return', {
  ['Chrome'] = {'ctrl', 'return'}, -- Save dokuwiki
})


key:bindUp({'shift', 'cmd'}, 'a', {'shift', 'cmd'}, 'a', {
  ['Chrome'] = {{'shift', 'option'}, 'a'}, -- Change Dark Theme Shortcut
})






















































