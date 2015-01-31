var doc = UltraEdit.activeDocument;

//todo
main();


function main()
{
	var col = doc.currentColumnNum;
	var row = doc.currentLineNum;
	var sp = jsGetHeadSpace(col);
	doc.write("do\r\n");
	doc.write(sp+"{\r\n");
	doc.write(sp+"} while();\r\n");
	doc.gotoLine(row+2, col+"} while(".length+1);
}


function jsGetHeadSpace(n)
{
	var sp = "";
	for (var i=0; i<n; i++)
		sp += " ";
	return sp;
}
