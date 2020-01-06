local key = require('modules.key')
event = require('hs.eventtap').event

-- key:bindDown('shift', 38, function()
--   print('()')
--   hs.eventtap.keyStrokes('()')
--   hs.eventtap.keyStroke('left')
-- end)

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

key:bindUp('shift', ',', function()
  hs.eventtap.keyStrokes('<>')
  hs.eventtap.keyStroke(nil, 'left')
end)