--[[
    From @maxandersen's gist here: https://gist.github.com/maxandersen/d09ebef333b0c7b7f947420e2a7bbbf5
    === HammerText ===
    Based on: https://github.com/Hammerspoon/hammerspoon/issues/1042
    How to "install":
    - Simply copy and paste this code in your "init.lua".
    How to use:
      - Add this init.lua to ~/.hammerspoon/Spoons/HammerText.spoon
      - Add your hotstrings (abbreviations that get expanded) to the "keywords" list following the example format.
      ht = hs.loadSpoon("HammerText")
      ht.keywords ={
         nname = "Max Rydahl Andersen",
         xdate = function() return os.date("%B %d, %Y") end,
      }
      ht:start()
    Features:
    - Text expansion starts automatically in your init.lua config.
    - Hotstring expands immediately.
    - Word buffer is cleared after pressing one of the "navigational" keys.
      PS: The default keys should give a good enough workflow so I didn't bother including other keys.
          If you'd like to clear the buffer with more keys simply add them to the "navigational keys" conditional.
    Limitations:
    - Can't expand hotstring if it's immediately typed after an expansion. Meaning that typing "..name..name" will result in "My name..name".
      This is intentional since the hotstring could be a part of the expanded string and this could cause a loop.
      In that case you have to type one of the "buffer-clearing" keys that are included in the "navigational keys" conditional (which is very often the case).
--]] -- https://github.com/cweagans/dotfiles/commit/84da84d672bb2158b95fa28e5dd840dd21d3bb1c
local obj = {}
obj.__index = obj

-- Metadata
obj.name = "HammerText"
obj.version = "1.0"
obj.author = "Multiple Authors"

--- Keychain.logger
--- Variable
--- Logger object used within the Spoon. Can be accessed to set the default log level for the messages coming from the Spoon.
obj.logger = hs.logger.new('HammerText')

--- HammerText.keywords
--- Variable
--- Map of keywords to strings or functions that return a string
--- to be replaced.
obj.keywords = {
    ["..name"] = {"My name"},
    ["..addr"] = {"My address"}
}

obj.maxLen = 17

function trigger(word)
    -- finally, if "word" is a hotstring
    local output = obj.keywords[word]
    if output then
        text = output[1]
        func = output[2]
        len = output[3]

        print("in trigger")

        if len == nil then
            len = utf8.len(word)
        end
        for i = 1, len, 1 do
            hs.eventtap.keyStroke({}, "delete", 0)
        end

        if func then
            local _, o = pcall(func)
            if not _ then
                print("error" .. o)
                -- obj.logger.ef("~~ expansion for '" .. 'what' .. "' gave an error of " .. o)
            end
            -- text = o
        end

        if text then
            hs.eventtap.keyStrokes(text) -- expand the word
        end

        word = "" -- clear the buffer
        return true
    end
    return false
end

function expander()
    local word = ""
    local keyMap = require"hs.keycodes".map
    local keyWatcher

    -- create an "event listener" function that will run whenever the event happens
    keyWatcher = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(ev)
        local keyCode = ev:getKeyCode()
        local char = ev:getCharacters()

        -- if "delete" key is pressed
        if keyCode == keyMap["delete"] then
            if #word > 0 then
                -- remove the last char from a string with support to utf8 characters
                local t = {}
                for _, chars in utf8.codes(word) do
                    table.insert(t, chars)
                end
                table.remove(t, #t)
                word = utf8.char(table.unpack(t))
                obj.logger.df("Word after deleting:", word)
            end
            return false -- pass the "delete" keystroke on to the application
        end

        -- append char to "word" buffer
        word = word .. char
        obj.logger.df("Word after appending:", word)

        -- if one of these "navigational" keys is pressed
        if keyCode == keyMap["return"] or keyCode == keyMap["space"] or keyCode == keyMap["up"] or keyCode ==
            keyMap["down"] or keyCode == keyMap["left"] or keyCode == keyMap["right"] then
            word = "" -- clear the buffer
        end

        obj.logger.df("Word to check if hotstring:", word)

        wordLen = string.len(word)
        if wordLen > obj.maxLen then
            word = string.sub(word, wordLen - obj.maxLen, wordLen)
        end

        wordLen = string.len(word)
        result = false
        for i = 1, wordLen, 1 do
            if result == false then
                part = string.sub(word, wordLen - i + 1, wordLen)
                result = trigger(part)
            end
        end

        return false -- pass the event on to the application
    end):start() -- start the eventtap

    -- return keyWatcher to assign this functionality to the "expander" variable to prevent garbage collection
    return keyWatcher
end

--- HammerText:start()
--- Method
--- Start HammerText
---
--- Parameters:
---  * None
function obj:start()
    print("Heeey! Hammertext is running !")
    expander()
end

return obj
