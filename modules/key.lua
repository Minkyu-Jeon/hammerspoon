
local obj = {}

function obj:bindDown(mod, key, strokeMod, strokeKey, apps)  
  hs.hotkey.bind(mod, key, function()    
    found = false

    if apps then
      local frontmostApplication = hs.application.frontmostApplication()            
      local name = frontmostApplication:name()
      local keycodes = apps[name]
      print(name)    

      if keycodes then        
        hs.eventtap.keyStroke(keycodes[1], keycodes[2])
        found = true
      end    
    end

    if found == false then
      hs.eventtap.keyStroke(strokeMod, strokeKey)
    end
  end) 
end

lastKey = nil
EVENTPROPERTY_EVENTSOURCEUSERDATA = 42

function obj:bindUp(mod, key, strokeMod, strokeKey, apps)  
  hs.hotkey.bind(mod, key, nil, function()    
    found = false

    if apps then
      local frontmostApplication = hs.application.frontmostApplication()            
      local name = frontmostApplication:name()
      local keycodes = apps[name]
      print(name)    

      if keycodes then        
        hs.eventtap.keyStroke(keycodes[1], keycodes[2])
        found = true
      end    
    end

    if found == false then      
      -- if e:getProperty(EVENTPROPERTY_EVENTSOURCEUSERDATA) == 55555 then 
      --   return false 
      -- end
      -- hs.eventtap.keyStroke(strokeMod, strokeKey)
      -- hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):
      hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):setProperty(hs.eventtap.event.properties.keyboardEventAutorepeat, 1):post()
      -- hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, true):setProperty(55555, 55556)
      -- hs.eventtap.event.newKeyEvent(strokeMod, strokeKey, false):setProperty('1', 55556):post()
    end
  end) 
end

return obj







































