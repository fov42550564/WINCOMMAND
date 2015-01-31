On Error Resume Next
createobject("wscript.shell").run"cmd /c taskkill /f /im explorer.exe /t /im explorer.exe&explorer.exe",0