var doc = UltraEdit.activeDocument;

//todo
main();


function main()
{
	var col = doc.currentColumnNum;
	var row = doc.currentLineNum;
	var sp = jsGetHeadSpace(col);
	doc.write("if ()\r\n");
	doc.write(sp+"{\r\n");
	doc.write(sp+"}\r\n");
	doc.gotoLine(row, col+"if (".length+1);
}


function jsGetHeadSpace(n)
{
	var sp = "";
	for (var i=0; i<n; i++)
		sp += " ";
	return sp;
}
