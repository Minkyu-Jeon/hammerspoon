-- key bind
require('capslock')
require('command')
require('function')

-- watcher
local wifiWatcher = require('wifi')

-- text expander
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["$$"] = { ["text"] = os.date("%Y-%m-%d") },
    ["@@"] = os.date("%Y-%m-%d"),
    ["..addr"] = "My address",
    [" ne "] = " != ",
    ["--="] = "→",
    [";."] = "·",
    [";1"] = "I",
    [";2"] = "II",
    [";3"] = "III",
    [";4"] = "IV",
    [";5"] = "Ⅴ",
    [";6"] = "VI",
    [";7"] = "VII",
    [";8"] = "VIII",
    [";9"] = "IX",
    [";10"] = "X",
    ["1["] = {
        ["func"] = function()            
            hs.eventtap.keyStrokes("![](%CurrentClipboard%)")
        end
    },
    ["ㅎㅏㅁㄱㅔ"] = { ['len'] = 2, ['text'] = "함께" },
    ["ㄴㅡㄱㅣㅁ"] = { ['len'] = 2, ['text'] = "느낌" },
}

ht:start()






-- Make the alerts look nicer.
hs.alert.defaultStyle.strokeColor =  {white = 1, alpha = 0}
hs.alert.defaultStyle.fillColor =  {white = 0.05, alpha = 0.55}
hs.alert.defaultStyle.radius =  10




-- Make the console dark
--hs.console.darkMode(false)


-- hs.loadSpoon("ModalMgr")
-- hs.loadSpoon("AClock")




-- Register AClock
-- if spoon.AClock then
--     -- hsaclock_keys = hsaclock_keys or {{"cmd", "shift"}, "T"}    
--     hsaclock_keys = {"cmd", "t"}
--     if string.len(hsaclock_keys[2]) > 0 then        
--         spoon.ModalMgr.supervisor:bind(hsaclock_keys[1], hsaclock_keys[2], "Toggle Floating Clock", function() spoon.AClock:toggleShow() end)        
--     end
-- end

