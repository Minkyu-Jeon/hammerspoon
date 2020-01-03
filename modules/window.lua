local obj = {}

function obj:move(direction)
  return function()
      local win      = hs.window.focusedWindow()
      local app      = win:application()
      local app_name = app:name()
      local f        = win:frame()
      local screen   = win:screen()
      local max      = screen:frame()
      if direction == "left" then
          f.x = max.x
          f.w = (max.w / 2)
      elseif direction == "right" then
          f.x = (max.x + (max.w / 2))
          f.w = (max.w / 2)
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