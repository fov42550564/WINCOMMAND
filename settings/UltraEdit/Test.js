var doc = UltraEdit.activeDocument;

//todo
main();


function main()
{
	alert(doc.path);
}

function alert(s)
{
	UltraEdit.outputWindow.write(s);
}
