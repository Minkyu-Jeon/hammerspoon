local date = require('modules.date')

function left(times)
  for i=1, times, 1 do
    hs.eventtap.event.newKeyEvent(nil, "left", true):post()
    hs.eventtap.event.newKeyEvent(nil, "left", false):post()
  end
end

function todo(days)
  dateAfterNumberOfDays = date:formatAddDays(days)
  local text = "<todo due:" .. dateAfterNumberOfDays .. "></todo>"
  hs.eventtap.keyStrokes(text)
end

function change()
  hs.eventtap.keyStroke(nil, 'F13') 
end

-- text expander
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["$$"] = { os.date("%Y-%m-%d") },
    ["@@"] = { "$$" },
    ["..addr"] = "My address",
    [" ne "] = { " != " },
    ["--="] = { "→" },
    [";."] = { "·" },
    [";1"] = { "I" },
    [";2"] = { "II" },
    [";3"] = { "III" },
    [";4"] = { "IV" },
    [";5"] = { "Ⅴ" },
    [";6"] = { "VI" },
    [";7"] = { "VII" },
    [";8"] = { "VIII" },
    [";9"] = { "IX" },
    [";10"] = { "X" },
    ["1["] = { nil, function()     
        local clip = hs.pasteboard.getContents()    
        local text = "![](" .. clip .. ")"
        hs.eventtap.keyStrokes(text)
      end
    },
    ["ㅎㅏㅁㄱㅔ"] = { "함께", nil, 2 },
    ["ㄴㅡㄱㅣㅁ"] = { "느낌", nil, 2 },    
    ['/tot'] = { nil, function() todo(1) left(7) end },
    ['/tow'] = { nil, function() todo(7) left(7) end },
    ['/tom'] = { nil, function() todo(30) left(7) end },
    ['/fr'] = { nil, function()
      local text = "<fragment-block></fragment-block>"
      hs.eventtap.keyStrokes(text)
      left(17)      
      end 
    },    
    ['ㄱㅔㅅㄷ'] = {'겠ㄷ', nil, 2},
    ['ㅇㅣㅅㅇ'] = {'있ㅇ', nil, 2},
    ['ㅇㅗㅏㅅㄷ'] = {'왔ㄷ', nil, 2},
}

ht:start()