var express = require('express'),
    http = require('http')
    path = require('path'),
    fs = require('fs'),
	child_process = require('child_process'),
    JSZip = require('jszip');

var app = express();

function zipRecurse(zip, dir, zipDir) {
    var dirList = fs.readdirSync(dir);
    dirList.forEach(function(item){
        var fullName = dir + '/' + item;
        if(fs.statSync(fullName).isDirectory()){
            zipRecurse(zip, fullName, zipDir+'/'+item);
        }else{
            zip.folder(zipDir).file(item, fs.readFileSync(fullName));
        }
    });
}
function zipFolder(zip, dir, zipDir) {
    zipRecurse(zip, dir, zipDir);
    return zip.generate({base64:false, compression:'DEFLATE'});
}

function copy(str) {
	var command;
	switch(process.platform) {
		case "darwin":
			command = 'echo "'+str+'"|pbcopy';
			break;
		case "win32":
			command = 'mshta vbscript:clipboarddata.setdata("text","'+str+'")(close)';
			break;
		default:
			throw new Error("Unknown platform: '" + process.platform);
	}
	child_process.exec(
		command,
		function(err, stdout, stderr) {
			if (err) {
				throw new Error("copy error");
			}
		}
	);
}

function paste(callback) {
	var command;
	switch(process.platform) {
		case "darwin":
			child_process.exec(
				'pbpaste',
				function(err, stdout, stderr) {
					if (err) {
						throw new Error("copy error");
					}
					callback(stdout);
				}
			);
			break;
		case "win32":
			var paste_vbs='Set objHTML = CreateObject("htmlfile")\n'
			+'text = objHTML.ParentWindow.ClipboardData.GetData("Text")\n'
			+'Wscript.Echo text';
			fs.writeFileSync('paste.vbs', paste_vbs);
			child_process.exec('cscript /nologo paste.vbs',
				function(err, stdout, stderr) {
					if (err) {
						console.log(err);
						throw new Error("copy error");
					}
					callback(stdout);
					fs.unlinkSync('paste.vbs');
				}
			);
			break;
		default:
			throw new Error("Unknown platform: '" + process.platform);
	}
}

app.configure(function(){
    app.set('port', 3001);
    app.use(express.favicon());
    app.use(express.logger('dev'));
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(app.router);
});

app.configure('development', function(){
    app.use(express.errorHandler());
});

app.post('/postfile', function(req, res){
    req.pipe(require('unzip').Extract({path: "."}));
    req.on('end', function () {
        console.log("success");
        res.end("success");
    });
});

app.get('/getfile', function(req, res){
    var file = req.query.file,
        fullName = path.join(process.cwd(), file);
    console.log(fullName);
    if (fs.existsSync(fullName)) {
        var zip = new JSZip();
        if (fs.statSync(fullName).isDirectory()) {
            res.end(zipFolder(zip, fullName, file), "binary");
        } else {
            fs.readFile(fullName, function(err, data) {
                zip.file(file, data);
                res.end(zip.generate({base64:false, compression:'DEFLATE'}), "binary");
            });
        }
    } else {
        console.log("error file or path");
        res.send("error");
    }
});

app.get('/puttext', function(req, res){
	var text = req.query.text;
	console.log(text);
	copy(text);
	res.send("success");
});

app.get('/gettext', function(req, res){
	paste(function(text) {
		res.send(text);
		console.log("success");
	});
});

app.get('/disconnect', function(req, res){
    res.send("success");
    setTimeout(function(){process.exit();}, 100);
});


http.createServer(app).listen(app.get('port'), function(){
    console.log("Express server http://localhost:" + app.get('port'));
});
