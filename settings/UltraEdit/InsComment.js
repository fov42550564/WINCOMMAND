var doc = UltraEdit.activeDocument;

//todo
main();


function main()
{
	var lnFirst = doc.currentLineNum;
	var lnLast = jsGetSelectRows()+lnFirst-1;
	
	if (jsIsAllComment(lnFirst, lnLast))
		jsDelComment(lnFirst, lnLast);
	else
		jsAddComment(lnFirst, lnLast);
}



function jsAddComment(lnFirst, lnLast)
{
	doc.gotoLine(lnFirst);
	doc.gotoLineSelect(lnLast, 0xffff);

	UltraEdit.perlReOn();
	doc.findReplace.regExp = true;
	doc.findReplace.selectText = true;
	doc.findReplace.replaceAll = true;
	doc.findReplace.replace("^", "//");
	doc.gotoLine(lnLast, 0xffff);
}


function jsDelComment(lnFirst, lnLast)
{
	doc.gotoLine(lnFirst);
	doc.gotoLineSelect(lnLast, 0xffff);

	UltraEdit.perlReOn();
	doc.findReplace.regExp = true;
	doc.findReplace.selectText = true;
	doc.findReplace.replaceAll = true;
	doc.findReplace.replace("^(\\s)*//", "\\1");
	doc.gotoLine(lnLast, 0xffff);
}



function jsIsAllComment(lnFirst, lnLast)
{
	for (var i=lnFirst; i<=lnLast; i++)
		if (!jsIsComment(i))
			return false;
	return true;
}


function jsIsComment(ln)
{
	doc.gotoLine(ln);
	doc.selectLine();
	var lnstr = doc.selection;
	var reg = /(^\s*\/\/)|(^\s*$)/;
	return reg.test(lnstr);
}



function jsGetSelectRows()
{
	var eol = "\r\n";
  var text = doc.selection;
  var lines = text.split(eol);
 	return lines.length;
}


function jsGetLine(oldln, ln)
{
	doc.gotoLine(ln);
	doc.selectLine();
	var str = doc.selection;
	doc.gotoLine(oldln);
	return str.replace(/\r\n/,"");
}


function jsAddLineHead(ln, str)
{
	doc.gotoLine(ln);
	doc.selectLine();
	var lnstr = doc.selection;
	lnstr = str+lnstr;
	doc.write(lnstr);
}

function jsAddLineTail(ln, str)
{
	doc.gotoLine(ln);
	doc.selectLine();
	var lnstr = doc.selection;
	lnstr = lnstr.replace(/\r\n/,"");
	lnstr += str+"\r\n";
	doc.write(lnstr);
}