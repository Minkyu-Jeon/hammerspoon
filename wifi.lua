local wifiMenu = hs.menubar.new()
function ssidChangedCallback()
    SSID = hs.wifi.currentNetwork()
    if SSID == nil then
        SSID = "Disconnected"
    end
    print(SSID)
    if string.find(SSID, 'buzzni') then
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end
    wifiMenu:setTitle("(WIFI:" .. SSID .. ")" )
end
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
ssidChangedCallback()