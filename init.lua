
-- key
local capslockLua  = require('capslock')
local functionLua = require('function')

local wifiWatcher = require('wifi')
-- local reloadWatcher = require('reload')

local visualStudioCode = require('visual_studio_code')

-- text

ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["$$"] = os.date("%Y-%m-%d"),
    ["..addr"] = "My address",
}
ht:start()

