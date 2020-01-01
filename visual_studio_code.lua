local capslockShift = {"cmd", "option", "ctrl", "shift"}


local frontmostApplication = hs.application.frontmostApplication()

if frontmostApplication and frontmostApplication:name() == "Visual Studio Code" then
   -- launch code
  hs.hotkey.bind(capslockShift, "c", function()
    print('in code ha')
  end)
end

if hs.window.focusedWindow():application():name() == 'MacVim' then
  hs.reload()
end