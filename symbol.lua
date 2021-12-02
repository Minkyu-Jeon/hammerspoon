local key = require('modules.key')

key:bindUp({'shift'}, "9", function()
    hs.eventtap.keyStroke(nil, 'F14')
    hs.eventtap.keyStrokes('()')
    -- hs.eventtap.keyStroke(nil, 'left')
    -- hs.eventtap.keyStroke(nil, 'right')
    -- hs.eventtap.keyStrokes('(')
    -- hs.eventtap.keyStrokes(')')
    hs.eventtap.keyStroke(nil, 'left')
end)

-- key:bindUp(nil, '[', function()
--   -- hs.eventtap.keyStroke(nil, 'F19')  
--   hs.eventtap.keyStrokes('[]')
--   hs.eventtap.keyStroke(nil, 'left')
-- end)

function symbolDouble()
    hs.eventtap.keyStrokes('[]')
    hs.eventtap.keyStroke(nil, 'left')
end

key:bindUp(nil, '[', nil, '[', {
    ['Google Chrome'] = symbolDouble,
    ['Firefox'] = symbolDouble,
    ['Notion'] = symbolDouble
})

key:bindUp('shift', '[', function()
    -- hs.eventtap.keyStroke(nil, 'F19')  
    hs.eventtap.keyStrokes('{}')
    hs.eventtap.keyStroke(nil, 'left')
end)
