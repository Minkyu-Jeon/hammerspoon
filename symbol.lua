local key = require('modules.key')
local inputEnglish = "com.apple.keylayout.ABC"

key:bindUp({'shift'}, "9", function()
    local inputSource = hs.keycodes.currentSourceID()
    if not (inputSource == inputEnglish) then
        hs.eventtap.keyStroke(nil, 'F14')
    end

    hs.eventtap.keyStrokes('()')
    hs.eventtap.keyStroke(nil, 'left')
end)

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

-- hs.eventtap.keyStroke(nil, 'left')
-- hs.eventtap.keyStroke(nil, 'right')
-- hs.eventtap.keyStrokes('(')
-- hs.eventtap.keyStrokes(')')

-- key:bindUp(nil, '[', function()
--   -- hs.eventtap.keyStroke(nil, 'F19')  
--   hs.eventtap.keyStrokes('[]')
--   hs.eventtap.keyStroke(nil, 'left')
-- end)
