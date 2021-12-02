local const = require('modules.const')
local capslock = const.key.capslock
local inputEnglish = "com.apple.keylayout.ABC"

function changeInput()
    local frontmostApplication = hs.application.frontmostApplication()
    local name = frontmostApplication:name()
    local apps = {
        ["Code"] = true
    }
    if apps[name] then
        local inputSource = hs.keycodes.currentSourceID()

        if not (inputSource == inputEnglish) then
            hs.keycodes.currentSourceID(inputEnglish)
        end
    end

    hs.eventtap.event.newKeyEvent({}, 'escape', true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat,
        1):post()
end

hs.hotkey.bind({}, 'escape', nil, changeInput)
hs.hotkey.bind(capslock, 'tab', nil, changeInput)
