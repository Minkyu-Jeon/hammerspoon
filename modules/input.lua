local inputEnglish = "com.apple.keylayout.ABC"
local inputKorean = "com.apple.inputmethod.Korean.2SetKorean"

local obj = {}

function obj:toggleInput()
    local frontmostApplication = hs.application.frontmostApplication()    
    local inputSource = hs.keycodes.currentSourceID()

    if (inputSource == inputEnglish) then
        hs.keycodes.currentSourceID(inputKorean)
    else
        hs.keycodes.currentSourceID(inputEnglish) 
    end
end

return obj