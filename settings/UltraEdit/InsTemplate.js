var doc = UltraEdit.activeDocument;
var tmpl = "C:\\COMMAND\\settings\\UltraEdit\\tmpl\\";
var ts = ["asm","c","js","wsf"];

//todo
main();


function main()
{
	var me = jsGetFileIndex();
	var ftype = jsGetFileExName();
	if (jsIsTemplateExist(ftype))
	{
		var str = jsGetModule(tmpl+ftype);
		me.write(str);
	}
}

function alert(s)
{
	UltraEdit.outputWindow.write(s);
}


function jsIsTemplateExist(_tpl)
{
	for (var i=0; i < ts.length; i++)
		if (_tpl == ts[i])
			return true;
	return false;
}

function jsGetFileExName()
{
	var path = doc.path;
	path = path.replace(/.*\\(.*)$/, "$1");
	return path.replace(/.*\./, "");
}


function jsGetModule(_file)
{
	UltraEdit.open(_file);
	doc.selectAll();
	str = doc.selection;
	UltraEdit.closeFile(_file, 2);
	return str;
}


function jsGetFileIndex()
{
	for (var i=0; i < UltraEdit.document.length; i++)
		if (doc.path==UltraEdit.document[i].path)
			return UltraEdit.document[i];
	return UltraEdit.document[0];
}