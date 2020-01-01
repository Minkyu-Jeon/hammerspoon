local wifiMenu = hs.menubar.new()
function ssidChangedCallback()
    SSID = hs.wifi.currentNetwork()
    if SSID == nil then
        SSID = "Disconnected"
    end
    wifiMenu:setTitle("(WIFI:" .. SSID .. ")" )
end
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
ssidChangedCallback()