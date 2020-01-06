local obj = {}


obj.type = 0
obj.sizeList = { 1/2, 1/3, 2/3 }

function obj:move(direction)  
  return function()
      local win      = hs.window.focusedWindow()
      local app      = win:application()
      local app_name = app:name()
      local f        = win:frame()
      local screen   = win:screen()
      local max      = screen:frame()
      
      if obj.direction == direction then        
        obj.type = (obj.type + 1) % 3      
      else
        obj.type = 0
      end

      obj.direction = direction
      local ratio = obj.sizeList[obj.type + 1]
      print(ratio)

      if direction == "left" then
          f.x = max.x
          f.w = (max.w * ratio)
      elseif direction == "right" then
          f.x = (max.x + (max.w * (1-ratio)))
          f.w = (max.w * ratio)
      elseif direction == "up" then
          f.x = max.x
          f.w = max.w
      elseif direction == "down" then
          f.x = (max.x + (max.w / 8))
          f.w = (max.w * 3 / 4)
      end
      f.y = max.y
      f.h = max.h
      win:setFrame(f, 0.0)
  end
end

return obj