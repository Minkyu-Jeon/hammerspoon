
local obj = {}


function runApps(apps, func)
  if func ~= nil and type(func) == 'function' then
    local _, o = pcall(func)
    if not _ then
      obj.logger.ef("~~ expansion for '" .. 'what' .. "' gave an error of " .. o)
    end
    return true
  end

  if apps then
    local frontmostApplication = hs.application.frontmostApplication()            
    local name = frontmostApplication:name()
    local keycodes = apps[name]     

    if keycodes then
      if keycodes[2] then
        hs.eventtap.keyStroke(keycodes[1], keycodes[2])
      else
        hs.eventtap.keyStrokes(keycodes[1])
      end      
      return true
    end        
  end
  return false
end


function obj:bindDown(mod, key, strokeMod, strokeKey, apps)  
  hs.hotkey.bind(mod, key, function()        
    found = runApps(apps, strokeMod)   

    if found == false then      
      if mod == strokeMod and key == strokeKey then    
        hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):post()
        hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, false):post()
      else
        hs.eventtap.keyStroke(strokeMod, strokeKey)
      end
    end
  end) 
end


function obj:bindUp(mod, key, strokeMod, strokeKey, apps)  
  hs.hotkey.bind(mod, key, nil, function()    
    found = runApps(apps, strokeMod)   

    if found == false then
      if mod == strokeMod and key == strokeKey then                
        hs.eventtap.event.newKeyEvent(mod, key, true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()      
      else
        hs.eventtap.keyStroke(strokeMod, strokeKey)
      end
    end
  end) 
end

function obj:event(mod, key, strokeMod, strokeKey)
  hs.hotkey.bind(mod, key, function()    
    hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):post()
  end, function()    
    hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, false):post()
  end, function()    
    hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
  end)
end


function obj:appleScript(mod, key, script)  
  hs.hotkey.bind(mod, key, function()    
    hs.osascript.applescript(script)   
    -- hs.osascript.applescript("tell application \"System Events\" to key code 123 using control down")        
    -- hs.osascript.applescript("tell application \"Mission Control\" to launch")    
  end)
end



return obj












































