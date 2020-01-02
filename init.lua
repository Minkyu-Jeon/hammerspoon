-- key bind
require('capslock')
require('command')
require('function')

-- watcher
local wifiWatcher = require('wifi')

-- text expander
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["$$"] = os.date("%Y-%m-%d"),
    ["..addr"] = "My address",

}
ht:start()

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

