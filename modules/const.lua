local obj = {}

obj.app = {}
obj.app.androidStudio = 'Android Studio'
-- obj.app.visualStudioCode = 'Visual Studio Code'
obj.app.visualStudioCode = 'Code'
obj.app.finder = 'Finder'
obj.app.iTerm = 'iTerm'
obj.app.tabby = 'Tabby'
obj.app.slack = 'Slack'
obj.app.chrome = 'Google Chrome'
obj.app.notion = 'Notion'
obj.app.logseq = 'Logseq'

obj.key = {}
obj.key.capslock = {"option", "ctrl"}
obj.key.capslockCmd = {"cmd", "option", "ctrl"}
obj.key.capslockShift = {"option", "ctrl", "shift"}
obj.key.capslockCmdShift = {'cmd', "option", "ctrl", "shift"}

return obj
