var doc = UltraEdit.activeDocument;

//todo
main();


function main()
{
	var szAuthor = "fangyunjiang"
	var szDate = jsGetDate();
	var ln = doc.currentLineNum;
	doc.gotoLine(ln, 0xffff);
	doc.write(" //Add by "+szAuthor+" "+szDate);
}

function jsGetDate()
{
	var now = new Date();
	return (now.getYear()+1900)+"-"+(now.getMonth()+1)+"-"+now.getDate();
}
