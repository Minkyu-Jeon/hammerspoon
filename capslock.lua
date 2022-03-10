local const = require('modules.const')
local key = require('modules.key')
local window = require('modules.window')
local app = require('modules.app')
local input = require('modules.input')

local capslock = const.key.capslock
local capslockCmd = const.key.capslockCmd
local capslockShift = const.key.capslockShift
local capslockCmdShift = const.key.capslockCmdShift

-- reload
hs.hotkey.bind(capslock, 'r', function()
    hs.reload()
    hs.execute('espanso restart')
    hs.alert.show("HS reloaded")
end)

-- TODO: 캡스락 키 제어  
hs.hotkey.bind(capslock, 'y', function()
    hs.eventtap.event.newKeyEvent(nil, hs.keycodes.map.capslock, true):post()
end)

app:launch(capslock, 'g', const.app.finder)
app:launch(capslock, 't', 'Tabby')

-- app:launch(capslockShift, 'e', 'Evernote')
-- app:launch(capslock, 'w', 'Trello')
app:launch(capslockShift, 'w', 'Notion')
app:launch(capslockShift, 'e', 'Logseq')
key:event(capslock, 'e', {}, 'forwarddelete')
-- app:launch(capslock, 'n', 'Notion')
-- app:launch(capslockShift, 'w', 'Google Chrome')
app:launch(capslockShift, 'a', 'Android Studio')
app:launch(capslockShift, 'c', 'Visual Studio Code')
app:launch(capslockShift, 's', 'Slack')
-- app:launch(capslockCmd, 'p', 'Postman')
app:launch(capslockCmd, '0', 'Postico')

key:bindUp(capslock, 'a', 'cmd', 'a')
key:bindUp(capslock, 'c', 'cmd', 'c')
key:bindUp(capslock, 'v', 'cmd', 'v')
key:bindUp(capslock, 'z', 'cmd', 'z')
key:bindUp(capslock, 'x', 'cmd', 'x', {
    ['Emacs'] = {'cmd', 'delete'}
})
key:bindUp(capslock, 's', 'cmd', 's')
key:bindUp(capslock, 'f', 'cmd', 'f')


key:bindUp(capslock, 'p', capslock, 'p', {
    ['IntelliJ IDEA'] = {{'cmd', 'shift'}, 'p'}
})
local ClipboardTool = hs.loadSpoon("ClipboardTool")
ClipboardTool:start()
hs.hotkey.bind(capslockShift, 'p', function()
    ClipboardTool:toggleClipboard()
end)

-- 클립보드에서 앞 공백제거 후 붙여넣기
key:bindUp(capslockShift, 'v', function()
    clipboard = hs.pasteboard.getContents()

    minLen = string.len(clipboard)
    isFirst = true
    exceptFirst = false

    for t in clipboard:gmatch("[^\r\n]+") do
        w, s = string.match(t, "(%s*)(.*)")
        wLen = string.len(w)
        sLen = string.len(s)

        if sLen ~= 0 then
            if isFirst == true then
                isFirst = false
                if wLen == 0 then
                    exceptFirst = true
                elseif wLen < minLen then
                    minLen = wLen
                end
            else
                if wLen < minLen then
                    minLen = wLen
                end
            end
        end
    end

    newText = ""
    isFirst = true
    for t in clipboard:gmatch("[^\n]*") do
        if isFirst == true and exceptFirst == true then
            newText = t .. '\n'
            isFirst = false
        else
            -- if t:match("%S") ~= nil then        
            if string.find(t, "^%s*$") then
                r = t
            else
                r = string.sub(t, minLen + 1, string.len(t))
            end

            newText = newText .. r .. '\n'
        end
    end

    result = string.sub(newText, 1, string.len(newText))
    hs.pasteboard.setContents(result)
    hs.eventtap.keyStroke('cmd', 'v')
    hs.eventtap.keyStroke(nil, 'forwarddelete')
end)

key:bindDown(capslock, 'h', 'cmd', 'left')
key:bindDown(capslockShift, 'h', {"cmd", "shift"}, 'left')
key:bindUp(capslock, ';', 'cmd', 'right', {
    ['iTerm2'] = {{'cmd', 'shift'}, ';'}
})
key:bindDown(capslockShift, ';', {"cmd", "shift"}, 'right')
key:bindDown(capslock, 'm', {}, 'pageup')
key:bindDown(capslockShift, 'm', {"shift"}, 'pageup')
key:bindDown(capslock, ',', {}, 'pagedown')
key:bindDown(capslockShift, ',', {"shift"}, 'pagedown')

key:bindUp(capslock, '1', {}, 'F1', {
    ['Evernote'] = {{'option', 'cmd'}, '1'}
})
-- key:bindDown(capslock, '2', {}, 'F2')
key:appleScript(capslock, '3', 'tell application "Mission Control" to launch')
-- key:bindUp(capslock, '4', {'cmd', 'shift'}, '4')
-- key:appleScript(capslock, '5', [[
--     property N : 0
--     set N to N + 1
--     set picPath to ((POSIX path of (path to desktop)) & "Picture_" & N & ".png") as string
--     do shell script "screencapture -tjpg " & quoted form of picPath
--     ]])

key:bindUp(capslock, '[', 'cmd', '[', {
    -- [const.app.visualStudioCode] = {'ctrl', '-'}
    ['iTerm'] = {{'cmd', 'option'}, 'left'},
    ['Tabby'] = {{'cmd', 'option'}, 'left'}
})

key:bindUp(capslock, ']', 'cmd', ']', {
    -- [const.app.visualStudioCode] = {{'ctrl', 'shift'}, '-'}
    -- ['Code'] = {{'ctrl', 'shift'}, '-'}
    -- ['Code'] = {{'ctrl'}, '-'}
    ['iTerm'] = {{'cmd', 'option'}, 'right'},
    ['Tabby'] = {{'cmd', 'option'}, 'right'}
})

key:event(capslock, 'j', {}, 'left')
key:event(capslockCmd, 'j', {'option'}, 'left')
key:event(capslockShift, 'j', {'shift'}, 'left')
key:event(capslockCmdShift, 'j', {'option', 'shift'}, 'left')

key:event(capslock, 'l', {}, 'right')
key:event(capslockCmd, 'l', {'option'}, 'right')
key:event(capslockShift, 'l', {'shift'}, 'right')
key:event(capslockCmdShift, 'l', {'option', 'shift'}, 'right')

key:event(capslock, 'i', {}, 'up')
key:bindUp(capslockCmd, 'i', {'option'}, 'up', {
    -- ['Code'] = {'cmd', 'up'}
})
key:event(capslockShift, 'i', {'shift'}, 'up')
key:event(capslockCmdShift, 'l', {'option', 'shift'}, 'up')

key:event(capslock, 'k', {}, 'down')
key:bindUp(capslockCmd, 'k', {'option'}, 'down', {
    -- ['Code'] = {'cmd', 'down'}
})
key:event(capslockShift, 'k', {'shift'}, 'down')
key:event(capslockCmdShift, 'k', {'option', 'shift'}, 'down')

-- hs.hotkey.bind(capslockCmd, 'k', function()
--     -- local screen = hs.mouse.getCurrentScreen()
--     -- local nextScreen = screen:next()
--     -- local rect = nextScreen:fullFrame()
--     -- local center = hs.geometry.rectMidPoint(rect)
--     -- print(center)
--     local point = hs.mouse.absolutePosition()
--     hs.mouse.setRelativePosition({
--         x = point.x,
--         y = point.y + 10
--     })
-- end)

key:event(capslock, 'u', {}, 'delete')
key:bindUp(capslockCmd, 'u', function()
    hs.eventtap.keyStroke({'shift', 'option'}, 'left')
    hs.eventtap.keyStroke(nil, 'delete')
end)
key:event(capslock, 'o', {}, 'forwarddelete')
key:bindUp(capslockCmd, 'o', function()
    hs.eventtap.keyStroke({'shift', 'option'}, 'right')
    hs.eventtap.keyStroke(nil, 'delete')
end)

key:bindUp(capslock, 'q', {}, 'delete', {
    ['Code'] = {nil, 'escape'}
})

function blockquoteFunc()
    bq = "<blockquote><cite></cite></blockquote>"
    hs.eventtap.keyStrokes(bq)
    left(26)
end

-- key:bindDown(capslock, 'b', capslock, 'b', {
-- ['Code'] = {nil, "F12"}, -- follow
-- ['PyCharm'] = {nil, 'F3'},  -- toggle bookmark
-- ['Android Studio'] = {nil, 'F3'} -- toggle bookmark
-- })

key:bindUp(capslock, 'b', capslock, 'b', {
    -- ['Code'] = {'cmd', "b"},
    ['Code'] = {nil, "F12"}, -- follow
    ['PyCharm'] = {'cmd', 'b'},
    ['Android Studio'] = {'cmd', 'b'},
    ['Google Chrome'] = blockquoteFunc
})

function codeFunc()
    bq = [[<code>

</code>]]
    -- hs.eventtap.keyStrokes(bq)  
    cb = hs.pasteboard.getContents()
    hs.pasteboard.writeObjects(bq)
    hs.eventtap.keyStroke("cmd", "v")
    -- keyRepeat('enter', 2)
    -- left(7)
    keyRepeat('up', 1)

    hs.pasteboard.writeObjects(cb)

end

key:bindUp(capslock, 'd', capslock, 'd', {
    ['Google Chrome'] = codeFunc,
    ['Firefox'] = codeFunc
})

-- launch flameshot
key:bindUp(capslockShift, 'd', {'cmd', 'shift'}, 'x', {
    -- ['Google Chrome'] = {{'cmd', 'shift'}, '2'},
})

key:bindUp(capslock, 'w', capslock, 'w', {
    ['Emacs'] = {'ctrl', 'w'},
    ['Code'] = function()
        hs.eventtap.keyStrokes('ysiw')
    end
})

key:bindDown(capslockShift, 'b', capslockShift, 'b', {
    ['PyCharm'] = {'cmd', 'F3'}, -- toggle bookmark
    ['Android Studio'] = {'cmd', 'F3'} -- toggle bookmark
})

key:bindDown(capslock, 'delete', function()
    hs.eventtap.keyStroke('cmd', 'right')
    hs.eventtap.keyStroke({'shift', 'cmd'}, 'left')
    hs.eventtap.keyStroke(nil, 'delete')
end)



key:bindUp(capslock, 'space', function()
    input:toggleInput()
end) -- 한영전환
key:bindUp('shift', 'space', function()
    input:toggleInput() 
end) -- 한영전환

-- key:bindUp(capslock, ',', capslock, ',', {
--   ['Evernote'] = {"←"}
-- })

key:bindUp(capslock, '.', capslock, '.', {
    ['PyCharm'] = {"option", "return"},
    ['Android Studio'] = {"option", 'return'},
    ['Chrome'] = {'---->'},
    ['Code'] = {"cmd", "."},
    ['Evernote'] = {"→"}
})

key:bindUp(capslockShift, '.', function()
    hs.eventtap.keyStrokes('·')
end)

key:bindUp(capslock, '/', capslock, '/', {
    ['Google Chrome'] = {'---->>'},
    ['iTerm2'] = {{'cmd', 'option'}, '/'}
})

function dateFunc()
    local date = os.date("%Y-%m-%d")
    hs.eventtap.keyStrokes(date)
end

function h3dateFunc()
    local date = os.date("%Y-%m-%d")
    hs.eventtap.keyStrokes("### " .. date)
end

function dateFuncShort()
    weekNames = {"일", "월", "화", "수", "목", "금", "토"}
    cNow = os.date("*t")
    wday = weekNames[cNow["wday"]]
    local date = os.date("%y년 %m월 %d일")
    date = "#### " .. date .. " " .. "(" .. wday .. ")"
    hs.eventtap.keyStrokes(date)
end

function keyRepeat(key, times)
    for i = 1, times, 1 do
        hs.eventtap.event.newKeyEvent(nil, key, true):post()
        hs.eventtap.event.newKeyEvent(nil, key, false):post()
    end
end

function left(times)
    for i = 1, times, 1 do
        hs.eventtap.event.newKeyEvent(nil, "left", true):post()
        hs.eventtap.event.newKeyEvent(nil, "left", false):post()
    end
end

function todoFunc()
    now = os.time()
    days = 7
    numberOfDays = now + days * 24 * 3600
    dateAfterNumberOfDays = os.date("%Y-%m-%d", numberOfDays)
    todo = "<todo due:" .. dateAfterNumberOfDays .. "></todo>"
    hs.eventtap.keyStrokes(todo)
    left(7)
end

key:bindDown(capslock, '2', capslock, '2', {
    ['Code'] = {nil, 'F2'},
    ['PyCharm'] = {'shift', 'F6'},
    ['Google Chrome'] = dateFuncShort,
    ['Firefox'] = dateFuncShort,
    ['Notion'] = dateFunc,
    ['XD'] = dateFunc
})

key:bindDown(capslock, '3', capslock, '3', {
    [const.app.visualStudioCode] = h3dateFunc,
    ['PyCharm'] = {nil, 'F2'},
    ['Android Studio'] = {nil, 'F2'},
    ['Google Chrome'] = todoFunc,
    ['Notion'] = h3dateFunc
})

key:bindDown(capslock, '4', capslock, '4', {
    ['Code'] = {'$$ $$'}
})

key:bindDown(capslock, '6', capslock, '6', {
    ['Android Studio'] = {'shift', 'F6'},
    ['PyCharm'] = {'shift', 'F6'}
})

key:bindDown(capslock, '7', capslock, '7', {
    ['Code'] = {{'ctrl', 'alt', 'shift'}, 'left'},
})

key:bindDown(capslock, '8', capslock, '8', {
    ['Code'] = {{'ctrl', 'alt', 'shift'}, 'right'},
})

key:bindDown(capslock, '9', capslock, '9', {
    ['Chrome'] = {'←'},
    ['Code'] = {{'ctrl', 'alt', 'cmd'}, 'left'},
})

key:bindDown(capslock, '0', capslock, '0', {
    ['PyCharm'] = {'cmd', 'F3'}, -- show bookmark list
    ['Chrome'] = {'→'},
    ['Code'] = {{'ctrl', 'alt', 'cmd'}, 'right'},
})
local aclock = hs.loadSpoon('AClock')
hs.hotkey.bind(capslockShift, "0", function()
    aclock:toggleShow()
end)

key:bindUp(capslock, '-', capslock, '-', {
    ['PyCharm'] = {'shift', 'F2'}, -- show bookmark list
    [const.app.chrome] = {{'ctrl', 'shift'}, 'tab'},
    ['Notion'] = {'shift', 'tab'}
})

key:bindUp(capslock, '=', capslock, '=', {
    ['PyCharm'] = {nil, 'F2'}, -- show bookmark list
    [const.app.chrome] = {'ctrl', 'tab'},
    ['Notion'] = {nil, 'tab'}
})

hs.hotkey.bind(capslock, "Left", window:move("left"))
hs.hotkey.bind(capslock, "4", window:move("left"))
hs.hotkey.bind(capslock, "Right", window:move("right"))
hs.hotkey.bind(capslock, "6", window:move("left"))
hs.hotkey.bind(capslock, "Up", window:move("up"))
hs.hotkey.bind(capslock, "5", window:move("left"))
hs.hotkey.bind(capslock, "Down", window:move("down"))

-- key:bindUp(capslockShift, "return", {}, "return", {
    -- ['Code'] = {{'alt', 'ctrl', 'shift'}, 'return'} -- eval from start of file to cursor
-- })

hs.hotkey.bind(capslock, '\\', function()
    hs.urlevent.openURL("https://calendar.google.com/calendar/u/0/r/week?sf=true")
end)