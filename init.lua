-- key bind
local capslockLua  = require('capslock')
local functionLua = require('function')

-- watcher
local wifiWatcher = require('wifi')

-- text expander
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["$$"] = os.date("%Y-%m-%d"),
    ["..addr"] = "My address",
}
ht:start()

