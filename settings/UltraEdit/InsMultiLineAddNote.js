var doc = UltraEdit.activeDocument;



//todo
main();


function main()
{
	var szAuthor = "fangyunjiang"
	var szDate = jsGetDate();
	
	jsInsHeadAndTail("/*****************Add by "+szAuthor+" "+szDate+"************************/", 
	"/*****************Add by "+szAuthor+" end*******************************/")
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


function jsGetDate()
{
	var now = new Date();
	return (now.getYear()+1900)+"-"+(now.getMonth()+1)+"-"+now.getDate();
}