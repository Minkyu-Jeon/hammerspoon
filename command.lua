

--hs.caffeinate.lockScreen()

hs.hotkey.bind({'cmd'}, 'f13',  function() 
  print('lock screen')
  hs.caffeinate.lockScreen()
end)