local key = require('modules.key')
local inputEnglish = "com.apple.keylayout.ABC"




key:bindUp({'shift'}, "9", function()
    -- local inputSource = hs.keycodes.currentSourceID()
    -- if not (inputSource == inputEnglish) then
    --     hs.eventtap.keyStroke(nil, 'F14')
    -- end

    hs.eventtap.keyStrokes('()')
    hs.eventtap.keyStroke(nil, 'left')
end)



-- function createBracket()
--     hs.eventtap.keyStrokes('()')
--     hs.eventtap.keyStroke(nil, 'left')
-- end

-- key:bindUp({"shift"}, "9", {"shift"}, "9", {
--     ['Google Chrome'] = createBracket,
--     ['Firefox'] = createBracket,
--     ['Notion'] = createBracket,    
-- })

function squareBrackets()
    hs.eventtap.keyStrokes('[]')
    hs.eventtap.keyStroke(nil, 'left')
end

key:bindUp(nil, '[', nil, '[', {
    ['Google Chrome'] = squareBrackets,
    ['Firefox'] = squareBrackets,
    ['Notion'] = squareBrackets,
    ['DBeaver'] = squareBrackets,
    -- ['Logseq'] = squareBrackets
})

-- key:bindUp({"shift"}, "'", nil, "'", {})
-- key:bindUp(nil, "\'" , nil, '"', {}) 

key:bindUp('shift', '[', function()
    -- hs.eventtap.keyStroke(nil, 'F19')  
    hs.eventtap.keyStrokes('{}')
    hs.eventtap.keyStroke(nil, 'left')
end)

function curlyBrackets() 
    hs.eventtap.keyStrokes('{}')
    hs.eventtap.keyStroke(nil, 'left') 
end

-- key:bindUp(nil, ']', nil, ']', {
--     ['Logseq'] = curlyBrackets
-- })



-- hs.eventtap.keyStroke(nil, 'left')
-- hs.eventtap.keyStroke(nil, 'right')
-- hs.eventtap.keyStrokes('(')
-- hs.eventtap.keyStrokes(')')

-- key:bindUp(nil, '[', function()
--   -- hs.eventtap.keyStroke(nil, 'F19')  
--   hs.eventtap.keyStrokes('[]')
--   hs.eventtap.keyStroke(nil, 'left')
-- end)
