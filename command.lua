local key = require('modules.key')




key:bindUp('cmd', 'return', 'cmd', 'return', {
    ['Chrome'] = {'ctrl', 'return'}, -- Save dokuwiki
    ['IntelliJ IDEA'] = {{'shift', 'cmd'}, 'p'},
    ['DBeaver'] = {'ctrl', 'return'}
})


key:bindUp('shift', 'return', 'shift', 'return', {
    ['Postman'] = {'cmd', 'return'}, -- Postman RUN    
    ['DBeaver'] = {'ctrl', 'return'}
})


key:bindUp({'shift', 'cmd'}, 'a', {'shift', 'cmd'}, 'a', {
    ['Chrome'] = {{'shift', 'option'}, 'a'} -- Change Dark Theme Shortcut
})

key:bindUp({'cmd'}, 'e', {'cmd'}, 'e', {
    ['Code'] = {{'shift', 'cmd'}, 'e'}, -- Change Dark Theme Shortcut
    ['IntelliJ IDEA'] = {{'shift', 'cmd'}, 'o'}
})

key:bindUp({'cmd'}, 'j', {'cmd'}, 'j', {
    ['PyCharm'] = {'option', 'F12'}
})

-- key:bindUp({'cmd'}, 'p', {'cmd'}, 'p', {
--     ['PyCharm'] = {{'cmd', 'shift'}, 'o'}
-- })

-- key:bindUp({'cmd'}, 'r', {'cmd'}, 'r', {
--     ['PyCharm'] = {'ctrl', 'r'} -- RUN
-- })

key:bindUp({'cmd'}, 'd', {'cmd'}, 'd', {
    ['PyCharm'] = {'ctrl', 'd'} -- DEBUG
})

key:bindDown({'shift', 'cmd'}, 'j', {'shift', 'cmd'}, 'j', {
    -- ['IntelliJ IDEA'] = {{'shift', 'cmd'},'j'} 
})

key:bindUp({'shift', 'cmd'}, 'l', {'shift', 'cmd'}, 'l', {
    ['IntelliJ IDEA'] = {{'shift', 'cmd'}, 'k'}
})
