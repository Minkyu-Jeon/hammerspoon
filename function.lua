-- change layout
hs.hotkey.bind({}, "f13", function()
  hs.eventtap.keyStroke({"ctrl", "option"}, "space")
  local lay = hs.keycodes.currentLayout()
  if lay == "U.S." then
    -- hs.keycodes.setLayout("2-Set Korean")
    hs.keycodes.setMethod("2-Set Korean")
  else
    hs.keycodes.setLayout("U.S.")
  end
end)