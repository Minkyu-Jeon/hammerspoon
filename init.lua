
-- key
local capslockLua  = require('capslock')
local functionLua = require('function')

local wifiWatcher = require('wifi')
-- local reloadWatcher = require('reload')

local visualStudioCode = require('visual_studio_code')

-- text
-- https://github.com/cweagans/dotfiles/commit/84da84d672bb2158b95fa28e5dd840dd21d3bb1c
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["$$"] = os.date("%Y-%m-%d"),
    ["..addr"] = "My address",
}
ht:start()
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/KSheet.spoon/init.lua
-- https://github.com/johngrib/hammerspoon_clipboard/tree/0.1.0


