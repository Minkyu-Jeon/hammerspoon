-- change layout
-- hs.hotkey.bind({}, "f13", function()
--   hs.eventtap.keyStroke({"ctrl", "option"}, "space")
--   local lay = hs.keycodes.currentLayout()
--   print(lay)
--   if lay == "ABC" then
--     -- hs.keycodes.setLayout("2-Set Korean")
--     hs.keycodes.setMethod("2-Set Korean")
--   else
--     hs.keycodes.setLayout("ABC")
--   end
-- end)

local inputSource = {
  english = "com.apple.keylayout.ABC",
  korean = "com.apple.inputmethod.Korean.2SetKorean",
}

-- 한영변환
local changeInput = function()
  local current = hs.keycodes.currentSourceID()
  local nextInput = nil

  if current == inputSource.english then
      nextInput = inputSource.korean
  else
      nextInput = inputSource.english
  end
  hs.keycodes.currentSourceID(nextInput)
end

hs.hotkey.bind(nil, 'f13', changeInput)