For Each args In WScript.Arguments
strCopy = strCopy & " " & args
Next


Sub SetClipboardText(Text)   'д����Ϣ�����а�
    Set wsShell = CreateObject("WScript.Shell")
    wsShell.Run "mshta vbscript:ClipboardData.SetData("&chr(34)&"text"&chr(34)&"," &Chr(34)& Text &Chr(34)&")(close)",vbhide
End Sub


Function GetClipboardText()   '���ж�ȡ����Ϣ
    Set objHTML=CreateObject("htmlfile") 'xmlfile��mhtmlfileҲ����
    GetClipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")
End Function

SetClipboardText strCopy 

