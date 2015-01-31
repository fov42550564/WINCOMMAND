
Function GetWindowHandle(dm, title)
	hwnds = dm.EnumWindow(0, title, 0, 1+4+8+16)
	hwnds = split(hwnds, ",")
	GetWindowHandle = hwnds(0)
End Function


Sub SetWindowSize()
	Set dm = CreateObject("dm.dmsoft")
	'hwnd =  GetWindowHandle(dm, "QQÏÉ¾³")
	hwnd =  GetWindowHandle(dm, "ÃÍŒ¢‚÷")
WScript.Echo hwnd
	w = 900
	h = 700

	If Wscript.Arguments(0) <> "" Then
		w = Wscript.Arguments(0)
	End If
	
	If Wscript.Arguments(1) <> "" Then
		h = Wscript.Arguments(1)
	End If
	
	dm.SetWindowSize hwnd, w, h
	Set dm = Nothing
End Sub

SetWindowSize