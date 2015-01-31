var doc = UltraEdit.activeDocument;
var rep = "##";

//todo
main();


function main()
{
	UltraEdit.perlReOn();
	doc.findReplace.regExp = true;
	doc.findReplace.selectText = true;
	doc.findReplace.replaceAll = true;
	doc.findReplace.replace("\r\n", rep);
	var str = doc.selection;
	if (jsIsComment(str))
	{
		doc.findReplace.replace("^(\\s*)/\\*", "\\1");
		doc.findReplace.replace("\\*/(\\s*)$", "\\1");
	}
	else
	{
		doc.findReplace.replace("^", "/*");
		doc.findReplace.replace("$", "*/");
	}
	doc.findReplace.replace(rep, "\r\n");
	doc.gotoLine(lnLast, 0xffff);
}



function jsIsComment(str)
{
	var reg = /^\s*\/\*.*\*\/\s*$/;
	return reg.test(str);
}
