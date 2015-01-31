var ue = UltraEdit;
var doc = UltraEdit.activeDocument;


//todo
main();


function main()
{
	var szMacro = ue.getString("Please Input The Macro", 1)
	jsInsHeadAndTail("#ifdef "+szMacro, "#endif /*"+szMacro+"*/")
}


function jsInsHeadAndTail(szHead, szTail)
{
	var lnFirst = doc.currentLineNum;
	var lnLast = jsGetSelectRows()+lnFirst;
	
	doc.gotoLine(lnFirst);
	doc.write(szHead+"\r\n");
	doc.gotoLine(lnLast, 0xffff);
	doc.write("\r\n"+szTail);
}


function jsGetSelectRows()
{
	var eol = "\r\n";
  var text = doc.selection;
  var lines = text.split(eol);
 	return lines.length;
}


