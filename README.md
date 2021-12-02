# hammerspoon

홈페이지: https://www.hammerspoon.org/

Hotstring은 expanso 사용

- https://github.com/hetima/hammerspoon-foundation_remapping/blob/master/foundation_remapping.lua

## Text Expander

-- https://github.com/cweagans/dotfiles/commit/84da84d672bb2158b95fa28e5dd840dd21d3bb1c

## ETC

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/KSheet.spoon/init.lua
-- https://github.com/johngrib/hammerspoon_clipboard/tree/0.1.0

## Expose

- https://www.hammerspoon.org/docs/hs.expose.html#toggleShow

## Apple Script

- https://stackoverflow.com/questions/29165847/automator-applescript-how-to-new-desktop-open-calendar-and-reminders-in-it

## Awesome

- https://github.com/ashfinal/awesome-hammerspoon/
- https://github.com/jasonrudolph/keyboard
- https://www.hammerspoon.org/Spoons/

### Util

- https://gist.github.com/philc/ed70ae4e60062c2d494fae97d5da43ce

## example

```lua
-- Lock the screen. This may also be possible with hs.caffeinate.lockScreen.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "l", function()
  os.execute("/Users/phil/scripts/macos/lock_screen.sh")
end)

-- Lock the screen. This may also be possible with hs.caffeinate.lockScreen.
hs.hotkey.bind(mash_app, "9", function()
  os.execute("/Users/phil/scripts/macos/lock_screen.sh")
end)
```
