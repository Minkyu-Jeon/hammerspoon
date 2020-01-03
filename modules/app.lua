local obj = {}

function obj:launch(mod, key, app)
  hs.hotkey.bind(mod, key, function()    
    hs.application.launchOrFocus(app)
  end)
end

return obj