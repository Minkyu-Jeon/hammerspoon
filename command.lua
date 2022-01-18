local key = require('modules.key')

hs.hotkey.bind({'cmd'}, 'f13', function()
    hs.caffeinate.lockScreen()
end)

key:bindUp('cmd', 'return', 'cmd', 'return', {
    ['Chrome'] = {'ctrl', 'return'}, -- Save dokuwiki
    ['IntelliJ IDEA'] = {{'shift', 'cmd'}, 'p'}
})

key:bindUp({'shift', 'cmd'}, 'a', {'shift', 'cmd'}, 'a', {
    ['Chrome'] = {{'shift', 'option'}, 'a'} -- Change Dark Theme Shortcut
})

key:bindUp({'cmd'}, 'e', {'cmd'}, 'e', {
    ['Code'] = {{'shift', 'cmd'}, 'e'}, -- Change Dark Theme Shortcut
    ['IntelliJ IDEA'] = {{'shift', 'cmd'}, 'o'}
})


-- intellij Cursive

key:bindDown({'shift', 'cmd'}, 'j', {'shift', 'cmd'}, 'j', {
    -- ['IntelliJ IDEA'] = {{'shift', 'cmd'},'j'} 
})

key:bindUp({'shift', 'cmd'}, 'l', {'shift', 'cmd'}, 'l', {
    ['IntelliJ IDEA'] = {{'shift', 'cmd'}, 'k'} 
})