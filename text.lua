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
  if days == 0 then
    text = "<todo></todo>"
  end
  hs.eventtap.keyStrokes(text)
  left(7)
end

function code(lang)  
  local text = "```" .. lang .. "\n\n```"
  hs.pasteboard.setContents(text)  
  hs.eventtap.keyStroke('cmd', 'v')
  -- hs.eventtap.keyStroke({}, 'up')
  -- hs.eventtap.keyStroke({}, 'up')
end


function str(type)
  -- 마지막 글자가 자음 하나이면, 따로 처리한다.
  local len = string.len(type)
  local word = string.sub(type, 0, len-3)
  local last = string.sub(type, len-2, len)

  hs.eventtap.keyStrokes(word)

  if last == 'ㄷ' then 
    hs.eventtap.keyStroke(nil, 'e')
  elseif last == 'ㄴ' then 
    hs.eventtap.keyStroke(nil, 's')
  elseif last == 'ㅇ' then 
      hs.eventtap.keyStroke(nil, 'd')
  else
    hs.eventtap.keyStrokes(last)
  end
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
    ["ㅎㅏㅁㄱㅔ"] = { "함께", nil, 3 },
    ["ㄴㅡㄱㅣ"] = { "느끼", nil, 3 },    
    ['/tt'] = { nil, function() todo(0) end },
    ['/tot'] = { nil, function() todo(1) end },
    ['/tow'] = { nil, function() todo(7) end },
    ['/tom'] = { nil, function() todo(30) end },
    ['/fb'] = { nil, function()
      local text = "<fragment-block></fragment-block>"
      hs.eventtap.keyStrokes(text)
      left(17)      
      end 
    },    
    ['`js'] = { nil, function() code('javascript') end },
    ['`ㅓㄴ'] = { nil, function() code('javascript') end },
    ['`py'] = { nil, function() code('python') end },
    ['`ㅔㅛ'] = { nil, function() code('python') end },
    ['`sh'] = { nil, function() code('shell') end },
    ['`ㄴㅗ'] = { nil, function() code('shell') end },
    ['`sq'] = { nil, function() code('sql') end },
    ['`ㄴㅂ'] = { nil, function() code('sql') end },
    -- 한글
    ['ㄱㅔㅅㄷ'] = {'겠ㄷ', nil, 2},
    ['ㅇㅣㅅㄴ'] = { nil, function() str('있ㄴ') end, 2},
    ['ㅇㅣㅅㅇ'] = { nil, function() str('있ㅇ') end, 2},
    ['ㅇㅣㅅㄷ'] = { nil, function() str('있ㄷ') end, 2},
    ['ㅇㅗㅏㅅㄷ'] = {'왔ㄷ', nil, 2},
    -- 한 -> 영
    ['ㅐㅏㄱ'] = { 'OKR', nil, 3 },
    ['ㅁㅔㅑ'] = { 'API', nil, 2 },
    -- ['ㅕㄱㅣ'] = { 'URL', nil, 3 },
    -- Symbol
    ['--='] = { '→' },
    ['0--'] = { '←' },
    ['0-='] = { '↔️' },
    -- Alphabet    
    [';ㅁ'] = { 'A' },
    [';ㅇ'] = { 'D' },
    [';ㅎ'] = { 'G' },
    -- esperanto
    [';C'] = { 'Ĉ'},
    [';c'] = { 'ĉ'},
    [';G'] = { 'Ĝ'},
    [';g'] = { 'ĝ'},
    [';H'] = { 'Ĥ'},
    [';h'] = { 'ĥ'},
    [';J'] = { 'Ĵ'},
    [';j'] = { 'ĵ'},
    [';S'] = { 'Ŝ'},
    [';s'] = { 'ŝ'},
    [';U'] = { 'Ŭ'},
    [';u'] = { 'ŭ'},
}

ht:start()




