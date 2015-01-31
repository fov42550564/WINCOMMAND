For Each args In WScript.Arguments
strCopy = strCopy & " " & args
Next


Sub SetClipboardText(Text)   '写入信息到剪切板
    Set wsShell = CreateObject("WScript.Shell")
    wsShell.Run "mshta vbscript:ClipboardData.SetData("&chr(34)&"text"&chr(34)&"," &Chr(34)& Text &Chr(34)&")(close)",vbhide
End Sub


Function GetClipboardText()   '剪切读取板信息
    Set objHTML=CreateObject("htmlfile") 'xmlfile、mhtmlfile也可以
    GetClipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")
End Function

SetClipboardText strCopy 

