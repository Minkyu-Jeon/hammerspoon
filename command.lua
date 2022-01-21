local key = require('modules.key')

hs.hotkey.bind({'cmd'}, 'f13', function()
    hs.caffeinate.lockScreen()
end)

key:bindUp('cmd', 'return', 'cmd', 'return', {
    ['Chrome'] = {'ctrl', 'return'} -- Save dokuwiki
})

key:bindUp({'shift', 'cmd'}, 'a', {'shift', 'cmd'}, 'a', {
    ['Chrome'] = {{'shift', 'option'}, 'a'} -- Change Dark Theme Shortcut
})

key:bindUp({'cmd'}, 'e', {'cmd'}, 'e', {
    ['Code'] = {{'shift', 'cmd'}, 'e'} -- Change Dark Theme Shortcut
})

key:bindUp({'cmd'}, 'j', {'cmd'}, 'j', {
    ['PyCharm'] = {'option', 'F12'}
})

key:bindUp({'cmd'}, 'p', {'cmd'}, 'p', {
    ['PyCharm'] = {{'cmd', 'shift'}, 'o'}
})

key:bindUp({'cmd'}, 'r', {'cmd'}, 'r', {
    ['PyCharm'] = {'ctrl', 'r'} -- RUN
})

key:bindUp({'cmd'}, 'd', {'cmd'}, 'd', {
    ['PyCharm'] = {'ctrl', 'd'} -- DEBUG
})
