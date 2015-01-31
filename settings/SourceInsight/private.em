/******************************************************************************
 * Copyright (C) 2010-2011   FANG
 * All rights reserved.
 * 
 * FileName: private.em
 * Content : the defination of source insight macro
 *
 * 
 * Version : 1.00
 * Author  : FangYunJiang
 * Date    : 2011-06-23
 ******************************************************************************/
 
macro get_author(abb)
{
	if (abb)return "fang"
	return "FangYunJiang"
}


macro get_cur_date()
{
	szTime = GetSysTime(1)
	Day = szTime.Day
	Month = szTime.Month
	Year = szTime.Year

	if (Day < 10)Day = "0@Day@"
	if (Month < 10)Month= "0@Month@"

	return "@Year@-@Month@-@Day@"
}


macro str_replace(str, oldPattern, newPattern)
{
	hbuf = NewBuf("tmp")
	InsBufLine (hbuf,  0, str)
	ReplaceInBuf(hbuf, oldPattern, newPattern, 0, 1, false, true, false, false)
	rs = GetBufLine (hbuf, 0)
	CloseBuf (hbuf)
	return rs
}



macro trim(str)
{
	return str_replace(str, "^[\\s\\t]*\\(.*\\)[\\s\\t]*$", "\\1")
}


macro ltrim(str)
{
	return str_replace(str, "^[\\s\\t]*\\(.*\\)$", "\\1")
}

macro rtrim(str)
{
	return str_replace(str, "^\\(.*\\)[\\s\\t]*$", "\\1")
}


macro _trim(str)
{
	rs = ""
	s = 0
	e = strlen(str)-1
	while (s <= e )
	{
		if (str[s] == " " || str[s] == "	")
			s = s + 1
		else
			break
	}
	while (e >= 0)
	{
	 	if (str[e] == " " || str[e] == "	")
			e = e - 1
		else
			break
	}

	if (s <= e)rs = strmid(str, s, e+1)
	return rs
}


macro getnext(partn)
{
	next = "                                                     "
	j = 1
	k = 0
	lenP = strlen(partn)
	next[1] = 0
	while (j < lenP)
	{
		if ( k == 0 )
		{
			j = j + 1
			k = k + 1
			next[j] = k
		}
		else if ( partn[j-1] == partn[k-1])
		{
			j = j + 1
			k = k + 1
			next[j] = k
		}
		else
		{
			k = next[k]
		}
	}
	return trim(next)
}


macro _strstr(str, substr)
{
	posP = 0
	posT = 0
	next = getnext(substr)
	lenP = strlen(substr)
	lenT = strlen(str)

	while (posP < lenP && posT < lenT)
	{
		if (posP == -1)
		{
			posP = posP + 1
			posT = posT + 1
		}
		else if (substr[posP] == str[posT])
		{
			posP = posP + 1
			posT = posT + 1
		}
		else
		{
			posP = next[posP]-1
		}
	}
	
	if (posP < lenP)
	{
		return -1
	}
	else
		return posT - lenP
}


macro strstr(str, substr)
{
	len = strlen(str)
	dlen = strlen(substr)
	i = 0
	j = 0
	while (i <= len-dlen)
	{
		while (j < dlen)
		{
			if (str[i+j] != substr[j])
				break
			j = j + 1
		}
		if (j == dlen)
			return i
		i = i + 1
	}
	return -1
}


macro strchr(str, ch)
{
	len = strlen(str)
	i = 0
	while (i < len)
	{
		if (str[i] == ch)
			return i
		i = i + 1
	}
	return -1
}


macro strrchr(str, ch)
{
	len = strlen(str)
	while (len >= 0)
	{
		if (str[i] == ch)
			return i
		i = i - 1
	}
	return -1
}

macro strdel(str, substr)
{
	pos = strstr(str, substr)
	lenstr = strlen(str)
	lensubstr = strlen(substr)
	s1 = strmid(str, 0, pos)
	s2 = strmid(str, pos+lensubstr, lenstr)
	return  "@s1@@s2@"
}


macro split(str, delims)
{
	dlen = strlen(delims)
	hbuf = NewBuf("split")
	ln = 0
	
	while (true)
	{
		len = strlen(str)
		i = strstr(str, delims)
		if (i == -1)
		{
			if (trim(str) != "")
				InsBufLine (hbuf,  ln, str)
			break
		}
		tstr = strmid(str, 0, i)
		str = strmid(str, i+dlen, len)
		InsBufLine (hbuf,  ln, tstr)
		ln = ln + 1
	}
	return hbuf
}


macro isnote(str)
{
	_str = ltrim(str)
	if (strlen(_str) == 0)
		return true
	if (strlen(_str) < 2)
		return false
	if (_str[0] == "/" && _str[1] == "/")
		return true
	return false
}


macro is_all_note(hbuf, lnFirst, lnLast)
{
	ln = lnFirst
	while (ln <= lnLast)
	{
		str = GetBufLine(hbuf, ln)
		if (!isnote(str))
			return false
		ln = ln + 1
	}
	return true
}


macro  add_each_line_note(hbuf, lnFirst, lnLast)
{
	ln = lnFirst
	while (ln <= lnLast)
	{
		str = GetBufLine(hbuf, ln)
		PutBufLine (hbuf, ln, "//@str@")
		ln = ln + 1
	}
}


macro  del_each_line_note(hbuf, lnFirst, lnLast)
{
	ln = lnFirst
	while (ln <= lnLast)
	{
		str = GetBufLine(hbuf, ln)
		str = ltrim(str)
		len = strlen(str)
		if (len>0)
		{
			_str = strmid(str, 2, len)
			PutBufLine (hbuf, ln, _str)
		}
		ln = ln + 1
	}
}


macro is_in_line_note(str)
{
	str = trim(str)
	len = strlen(str)
	if (str[0] == "/" && str[1] == "*" && str[len-2] == "*" && str[len-1] == "/")
		return true
	return false
}


macro add_in_line_note(hbuf, str)
{
	str = "/*@str@*/"
	SetBufSelText (hbuf, str)
}


macro del_in_line_note(hbuf, str)
{
	len = strlen(str)
	str = strdel(str, "/*")
	str = strdel(str, "*/")
	SetBufSelText (hbuf, str)
}



//key: ctrl+atl+/
macro InsNote()
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	hbuf = GetCurrentBuf()

	if (lnFirst == lnLast)
	{
		str = GetBufSelText (hbuf)
		if (strlen(str) != 0)
		{
			if (is_in_line_note(str))
				del_in_line_note(hbuf, str)
			else
				add_in_line_note(hbuf, str)
			return
		}
	}


	if (is_all_note(hbuf, lnFirst, lnLast))
		del_each_line_note(hbuf, lnFirst, lnLast)
	else
		add_each_line_note(hbuf, lnFirst, lnLast)
}



//key : ctrl+alt+0
macro DumplicateSelect()
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	hbuf = GetCurrentBuf()

	ln = lnLast
	while (ln >= lnFirst)
	{
		str = GetBufLine(hbuf, lnLast)
		InsBufLine(hbuf, lnFirst, str)
		ln = ln - 1
	}
	SetBufIns(hbuf, lnLast+1, 0)
}


macro exchange_two_lines(hbuf, ln1, ln2)
{
	str1 = GetbufLine(hbuf, ln1)
	str2 = GetbufLine(hbuf, ln2)
	PutBufLine(hbuf, ln1, str2)
	PutBufLine(hbuf, ln2, str1)
}


//key : ctrl+alt+end
macro ExchangeSelDown()
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	hbuf = GetCurrentBuf()

	ln = lnFirst
	lns = lnLast-lnFirst+1
	while (ln <= lnLast)
	{
		
		exchange_two_lines(hbuf, ln,  ln+lns)
		ln = ln + 1
	}
	SetBufIns(hbuf, ln, 0)
}


//key : ctrl+alt+home
macro ExchangeSelUp()
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	hbuf = GetCurrentBuf()

	ln = lnFirst
	lns = lnLast-lnFirst+1
	while (ln <= lnLast)
	{
		
		exchange_two_lines(hbuf, ln,  ln-lns)
		ln = ln + 1
	}
}



macro get_file_name(szPathName)
{
	len = strlen(szPathName)
	i = len
	while (i > 0)
	{
	  	ch = szPathName[i-1]
	  	if ("\\" == "@ch@")
	   		break
	  	i = i - 1
	}
	
	 return strmid(szPathName, i, len)
}



macro ins_head_and_tail(szHead, szTail)
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	 
	hbuf = GetCurrentBuf()
	InsBufLine(hbuf, lnFirst, "@szHead@")
	InsBufLine(hbuf, lnLast+2, "@szTail@")
}


//key: ctrl+shift+i
macro InsIfDefined()
{
	szMacro = Ask("Please Input The Macro")
	ins_head_and_tail("#ifdef @szMacro@", "#endif /*@szMacro@*/")
}


//key: ctrl+atl+n
macro InsMultiLineAddNote()
{
	szAuthor = get_author(true)
	szDate = get_cur_date()
	ins_head_and_tail("/*****************Add by @szAuthor@ @szDate@************************/", 
	"/*****************Add by @szAuthor@ end*******************************/")
}


//key: ctrl+n
macro InsSingleLineAddNote()
{
	szAuthor = get_author(true)
	szDate = get_cur_date()
	
	hbuf = GetCurrentBuf()
	ln = GetBufLnCur (hbuf)
	str = GetBufLine(hbuf, ln)
	
	PutBufLine (hbuf, ln, "@str@ //Add by @szAuthor@ @szDate@")
}


//key: ctrl+atl+shift+f
macro InsFileHeader()
{
	 szAuthor = get_author(false)
	 szDate = get_cur_date()
	 
	 hbuf = GetCurrentBuf()
	 szpathName = GetBufName(hbuf)
	 szfileName = get_file_name(szpathName)
	 nlength = strlen(szfileName)
	 
	 InsBufLine(hbuf, 0, "/******************************************************************************")
	 InsBufLine(hbuf, 1, " * Copyright (C) 2010-2011   FANG")
	 InsBufLine(hbuf, 2, " * All rights reserved.")
	 InsBufLine(hbuf, 3, " * ")
	 InsBufLine(hbuf, 4, " * FileName: @szfileName@")
	 InsBufLine(hbuf, 5, " * Content : ")
	 InsBufLine(hbuf, 6, " * ")
	 InsBufLine(hbuf, 7, " * Version : 1.00")
	 InsBufLine(hbuf, 8, " * Author  : @szAuthor@")
	 InsBufLine(hbuf, 9, " * Date    : @szDate@")
	 InsBufLine(hbuf, 10, " ******************************************************************************/")

	SetBufIns(hbuf, 5, strlen(" * Content : "))
}


macro get_func_params(str)
{
	str = str_replace(str, ".*(\\(.*\\)).*", "\\1")
	hbuf = split(str, ",")
	return hbuf
}


//key: ctrl+atl+f
macro InsFuncHeader()
{
	szAuthor = "FangYunJiang"
	szDate = get_cur_date()

	hbuf = GetCurrentBuf()
	 
	szFunc = GetCurSymbol()
	ln = GetSymbolLine(szFunc)

	if (ln < 0)
	{
		ln = GetBufLnCur (hbuf)
	}

	str = GetBufLine(hbuf, ln)
	hparambuf = get_func_params(str)
	lnparams = GetBufLineCount(hparambuf)
	i = 0
	
	InsBufLine(hbuf, ln, "/******************************************************************************")
	InsBufLine(hbuf, ln+1, " * NAME   : @szFunc@")
	InsBufLine(hbuf, ln+2, " * NOTE   : ")
	InsBufLine(hbuf, ln+3, " *"
	if (lnparams == 0)
		InsBufLine(hbuf, ln+4, " * PARAM  : NULL")
	else
		InsBufLine(hbuf, ln+4, " * PARAM  : ")
	while (i < lnparams)
	{
		param = GetBufLine(hparambuf, i)
		param = trim(param)
		InsBufLine(hbuf, ln+5+i, " *         |--@param@: ")
		i = i + 1
	}
	
	InsBufLine(hbuf, ln+5+lnparams, " * RETURN : ")
	InsBufLine(hbuf, ln+6+lnparams, " *"
	InsBufLine(hbuf, ln+7+lnparams, " * AUTHOR : @szAuthor@")
	InsBufLine(hbuf, ln+8+lnparams, " * DATE   : @szDate@")
	InsBufLine(hbuf, ln+9+lnparams" ******************************************************************************/")

	SetBufIns(hbuf, ln+2, strlen(" * NOTE   :"))
	CloseBuf(hparambuf)
}

//key: ctrl+shift+u
macro SetSelUpper()
{
	hwnd = GetCurrentWnd()
	hbuf =  GetCurrentBuf()
	sel = GetWndSel(hwnd)

	if (sel.lnFirst == sel.lnLast)
	{
		str = GetBufSelText (hbuf)
		str = toupper(str)
		SetBufSelText (hbuf, str)
	}
	else
	{
		str = GetBufLine(hbuf, sel.lnFirst)
		strh = strmid(str, 0,  sel.ichFirst)
		strt = strmid(str, sel.ichFirst, strlen(str))
		strt = toupper(strt)
		PutBufLine (hbuf,  sel.lnFirst, "@strh@@strt@")
		
		ln = sel.lnFirst + 1
		while (ln <= sel.lnLast -1)
		{
			str = GetBufLine(hbuf, ln)
			str = toupper(str)
			_ReplaceBufLine(hbuf, ln, str)
			ln = ln + 1
		}
		
		str = GetBufLine(hbuf, sel.lnLast)
		strh = strmid(str, 0,  sel.ichLim)
		strt = strmid(str, sel.ichLim, strlen(str))
		strh = toupper(strh)
		PutBufLine (hbuf,  sel.lnLast, "@strh@@strt@")

		SetBufIns(hbuf, sel.lnLast, sel.ichLim)
	}
}


//key: ctrl+u
macro SetSelLower()
{
	hwnd = GetCurrentWnd()
	hbuf =  GetCurrentBuf()
	sel = GetWndSel(hwnd)

	if (sel.lnFirst == sel.lnLast)
	{
		str = GetBufSelText (hbuf)
		str = tolower(str)
		SetBufSelText (hbuf, str)
	}
	else
	{
		str = GetBufLine(hbuf, sel.lnFirst)
		strh = strmid(str, 0,  sel.ichFirst)
		strt = strmid(str, sel.ichFirst, strlen(str))
		strt = tolower(strt)
		PutBufLine (hbuf,  sel.lnFirst, "@strh@@strt@")
		
		ln = sel.lnFirst + 1
		while (ln <= sel.lnLast -1)
		{
			str = GetBufLine(hbuf, ln)
			str = tolower(str)
			PutBufLine(hbuf, ln, str)
			ln = ln + 1
		}
		
		str = GetBufLine(hbuf, sel.lnLast)
		strh = strmid(str, 0,  sel.ichLim)
		strt = strmid(str, sel.ichLim, strlen(str))
		strh = tolower(strh)
		PutBufLine (hbuf,  sel.lnLast, "@strh@@strt@")

		SetBufIns(hbuf, sel.lnLast, sel.ichLim)
	}
}



macro del_sel_lines()
{
	hwnd = GetCurrentWnd()
	lnFirst = GetWndSelLnFirst(hwnd)
	lnLast = GetWndSelLnLast(hwnd)
	hbuf = GetCurrentBuf()
	
	ln = lnFirst
	while (ln <= lnLast)
	{
		DelBufLine (hbuf, lnFirst)
		ln = ln + 1
	}
	
	return lnFirst
}


macro get_head_space()
{
	hwnd = GetCurrentWnd()
	hbuf = GetCurrentBuf()
	ichFirst = GetWndSelIchFirst (hwnd)
	ln = GetWndSelLnFirst(hwnd)
	lnstr = GetBufLine(hbuf, ln)
	str = ""
	while (ichFirst > 0)
	{
		if (lnstr[ichFirst-1] == "	")
			str = "@str@	"
		else
			str = "@str@ "
		ichFirst = ichFirst - 1
	}

	return str
}



//key: ctrl+atl+t
macro InsTraceDebug()
{
	szAuthor = get_author(true)
	szNote = "printf(\"[star-net][@szAuthor@]: %s\\n\", __FUNCTION__);"
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()

	InsBufLine(hbuf,  ln, "@space@@szNote@")
	SetBufIns(hbuf, ln, strlen("@space@@szNote@"))
}



//key : ctrl+alt+i
macro InsCommandIf()
{
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()
	InsBufLine(hbuf, ln, "@space@if ()")
	InsBufLine(hbuf, ln+1, "@space@{")
	InsBufLine(hbuf, ln+2, "@space@}")
	
	SetBufIns(hbuf, ln, strlen("@space@if ("))
}


//key : ctrl+alt+s
macro InsCommandSwitch()
{
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()
	
	InsBufLine(hbuf, ln, "@space@switch ()")
	InsBufLine(hbuf, ln+1, "@space@{")
	InsBufLine(hbuf, ln+2, "@space@	case :")
	InsBufLine(hbuf, ln+3, "@space@		break;")
	InsBufLine(hbuf, ln+4, "@space@	default:")
	InsBufLine(hbuf, ln+5, "@space@		break;")
	InsBufLine(hbuf, ln+6, "@space@}")
	
	SetBufIns(hbuf, ln, strlen("@space@Switch ("))
}


//key : ctrl+alt+o
macro InsCommandFor()
{
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()
	
	InsBufLine(hbuf, ln, "@space@for (;;)")
	InsBufLine(hbuf, ln+1, "@space@{")
	InsBufLine(hbuf, ln+2, "@space@}")
	
	SetBufIns(hbuf, ln, strlen("@space@for ("))
}



//key : ctrl+alt+shift+o
macro InsCommandForEx()
{
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()
	
	InsBufLine(hbuf, ln, "@space@for (int i=0; i< ; i++)")
	InsBufLine(hbuf, ln+1, "@space@{")
	InsBufLine(hbuf, ln+2, "@space@}")
	
	SetBufIns(hbuf, ln, strlen("@space@for (int i=0; i<"))
}



//key : ctrl+alt+w
macro InsCommandWhile()
{
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()
	
	InsBufLine(hbuf, ln, "@space@while ()")
	InsBufLine(hbuf, ln+1, "@space@{")
	InsBufLine(hbuf, ln+2, "@space@}")
	
	SetBufIns(hbuf, ln, strlen("@space@while ("))
}


//key : ctrl+alt+d
macro InsCommandDoWhile()
{
	hbuf = GetCurrentBuf()
	space = get_head_space()
	ln = del_sel_lines()
	
	InsBufLine(hbuf, ln, "@space@do")
	InsBufLine(hbuf, ln+1, "@space@{")
	InsBufLine(hbuf, ln+2, "@space@} while();")
	
	SetBufIns(hbuf, ln+2, strlen("@space@} while("))
}


//key : ctrl + d
macro DelSelectLines()
{
	del_sel_lines();
}

macro ShowHelp()
{
	cr = CharFromAscii(13)
	help = "InsNote--ctrl+shift+alt+/"
	help = Cat(help, "@cr@InsIfDefined--ctrl+shift+i")
	help = Cat(help, "@cr@InsMultiLineAddNote--ctrl+alt+n")
	help = Cat(help, "@cr@InsSingleLineAddNote--ctrl+n")
	help = Cat(help, "@cr@InsTraceDebug--ctrl+alt+t")
	help = Cat(help, "@cr@InsFileHeader--ctrl+shift+alt+h")
	help = Cat(help, "@cr@InsFuncHeader--ctrl+alt+h")
	help = Cat(help, "@cr@SetSelUpper--ctrl+shift+u")
	help = Cat(help, "@cr@SetSelLower--ctrl+u")
	help = Cat(help, "@cr@InsCommandIf--ctrl+alt+i")
	help = Cat(help, "@cr@InsCommandSwitch--ctrl+alt+s")
	help = Cat(help, "@cr@InsCommandFor--ctrl+alt+f")
	help = Cat(help, "@cr@InsCommandForEx--ctrl+shift+alt+f")
	help = Cat(help, "@cr@InsCommandWhile--ctrl+alt+w")
	help = Cat(help, "@cr@InsCommandDoWhile--ctrl+alt+d")
	//help = Cat(help, "@cr@DelSelectLines--ctrl+d")

	Msg(help)
}


macro assigned_cmd_key(cmd, char, fCtrl, fShift, fAlt)
{
	key_value = KeyFromChar(char, fCtrl, fShift, fAlt)
	rs = AssignKeyToCmd(key_value, cmd)
	Msg(rs)
	if (0 == rs)
	{
		Msg("@cmd@ assined failed!")
	}
}


macro Test()
{//Load Search String
	RunCmd("Search Backward for Selection")
}


macro AssignedCommandKeys()
{
	//assigned_cmd_key("InsNote", 				"/", 1, 0, 1)
	//assigned_cmd_key("DumplicateSelect", 	"0", 1, 0, 1)
	//assigned_cmd_key("ExchangeSelDown", 		"end", 1, 0, 1)
	//assigned_cmd_key("ExchangeSelUp, 		"home", 1, 0, 1)
	assigned_cmd_key("InsIfDefined",			"i", 1, 1, 0)
	assigned_cmd_key("InsMultiLineAddNote", 	"n", 1, 0, 1)
	assigned_cmd_key("InsSingleLineAddNote", 	"n", 1, 0, 0)
	assigned_cmd_key("InsTraceDebug", 			"t", 1, 0, 1)
	assigned_cmd_key("InsFileHeader", 			"h", 1, 1, 1)
	assigned_cmd_key("InsFuncHeader", 			"h", 1, 0, 1)
	assigned_cmd_key("SetSelUpper", 			"u", 1, 1, 0)
	assigned_cmd_key("SetSelLower", 			"u", 1, 0, 0)
	assigned_cmd_key("InsCommandIf", 			"i", 1, 0, 1)
	assigned_cmd_key("InsCommandSwitch", 		"s", 1, 0, 1)
	assigned_cmd_key("InsCommandFor", 			"f", 1, 0, 1)
	assigned_cmd_key("InsCommandForEx", 		"f", 1, 1, 1)
	assigned_cmd_key("InsCommandWhile", 		"w", 1, 0, 1)
	assigned_cmd_key("InsCommandDoWhile", 		"d", 1, 0, 1)
	assigned_cmd_key("DelSelectLines", 			"d", 1, 0, 0)
}
