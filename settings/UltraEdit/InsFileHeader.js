var doc = UltraEdit.activeDocument;


//todo
main();

function main()
{
	var szfileName = jsGetFileName();
	var szAuthor = "fangyunjiang"
	var szDate = jsGetDate();
	
	with (doc)
	{
		top();
	 	write("/******************************************************************************\r\n");
	 	write(" * Copyright (C) 2010-2011   FANG"+"\r\n");
	 	write(" * All rights reserved.\r\n");
	 	write(" * \r\n");
	 	write(" * FileName: "+szfileName+"\r\n");
	 	write(" * Content : \r\n");
	 	write(" * \r\n");
	 	write(" * Version : 1.00\r\n");
		write(" * Author  : "+szAuthor+"\r\n");
	 	write(" * Date    : "+szDate+"\r\n");
	 	write(" ******************************************************************************/\r\n");
	}
}

function jsGetFileName()
{
	var path = doc.path;
	return path.replace(/.*\\(.*)$/, "$1");;
}


function jsGetDate()
{
	var now = new Date();
	return (now.getYear()+1900)+"-"+(now.getMonth()+1)+"-"+now.getDate();
}

