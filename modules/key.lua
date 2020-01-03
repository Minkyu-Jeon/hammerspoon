
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

function obj:bindUp(mod, key, strokeMod, strokeKey, apps)  
  hs.hotkey.bind(mod, key, nil, function()    
    found = false

    if apps then
      local frontmostApplication = hs.application.frontmostApplication()            
      local name = frontmostApplication:name()
      local keycodes = apps[name]
      -- print(name)    

      if keycodes then        
        hs.eventtap.keyStroke(keycodes[1], keycodes[2])
        found = true
      end    
    end

    if found == false then
      print(lastKey)
      if lastKey ~= strokeKey then
        hs.eventtap.keyStroke(strokeMod, strokeKey)
        lastKey = strokeKey
      else
        lastKey = nil
      end
    end
  end) 
end

return obj



































