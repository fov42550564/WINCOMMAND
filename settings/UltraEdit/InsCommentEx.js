var doc = UltraEdit.activeDocument;
var rep = "##";

//todo
main();

function alert(s)
{
	UltraEdit.messageBox(s);
}


function main()
{
	var str = doc.selection;
	if (jsIsComment(str))
	{
		doc.write(str.replace(/\/\*|\*\//g,""));
	}
	else
	{
		doc.write("/*"+str+"*/");
	}
}



function jsIsComment(str)
{
	str = str.replace(/\r\n/g, rep);
	reg = /^\s*\/\*.*\*\/\s*$/;
	return reg.test(str);
}