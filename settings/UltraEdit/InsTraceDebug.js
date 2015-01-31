var doc = UltraEdit.activeDocument;

//todo
main();


function main()
{
	var szAuthor = "fang";
	var szNote = "printf(\"[star-net]["+szAuthor+"]: %s\\n\", __FUNCTION__);";
	doc.write(szNote);
}
