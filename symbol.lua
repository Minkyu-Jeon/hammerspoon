local key = require('modules.key')


key:bindUp({'shift'}, "9", function()    
  hs.eventtap.keyStrokes('()')
  hs.eventtap.keyStroke(nil, 'left')  
end) 

key:bindUp(nil, '[', function()
  hs.eventtap.keyStrokes('[]')
  hs.eventtap.keyStroke(nil, 'left')
end)

key:bindUp('shift', '[', function()
  hs.eventtap.keyStrokes('{}')
  hs.eventtap.keyStroke(nil, 'left')
end)
