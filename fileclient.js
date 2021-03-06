var http = require('http'),
    path = require('path'),
    fs = require('fs'),
    JSZip = require('jszip'),
    child_process = require('child_process'),
    IP = "192.168.211.106",
    PORT = "3001",
    finish_cnt = 0;


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

function postFileToServer(file, cnt) {
    var options = {
        hostname: IP,
        port: PORT,
        path: '/postfile',
        method: 'POST'
    };

    var fullName = path.join(process.cwd(), file);
    console.log(fullName);
    if (fs.existsSync(fullName)) {
        var zip = new JSZip(),
            zipData;
        if (fs.statSync(fullName).isDirectory()) {
            zipData = zipFolder(zip, fullName, file);
        } else {
            zip.file(file, fs.readFileSync(fullName));
            zipData = zip.generate({base64: false, compression: 'DEFLATE' });
        }

        http.request(options, function(res) {
            res.on('data', function () {
                console.log('success');
                finish_cnt++;
                if (finish_cnt>=cnt) {
                    disconnectServer();
                }
            }).on('error', function(e) {
                console.log('error: ' + e.message);
                disconnectServer();
            });
        }).end(zipData, "binary");
    } else {
        console.log("error: no file");
        disconnectServer();
    }
}

function getFileFromServer(file, cnt) {
    var options = {
        hostname: IP,
        port: PORT,
        path: "/getfile?file="+file,
        agent: false
    };
    var req = http.get(options, function(res) {
        res.pipe(require('unzip').Extract({path: "."}));
        res.on('end', function(){
           console.log("get "+file+" success");
            finish_cnt++;
            if (finish_cnt>=cnt) {
                disconnectServer();
            }
        });
    }).on('error', function(e) {
        console.log("error: " + e.message);
        disconnectServer();
    });
}

function putTextToServer(text) {
	var options = {
        hostname: IP,
        port: PORT,
        path: "/puttext?text="+text,
        agent: false
    };
    var req = http.get(options, function(res) {
        res.on('end', function(){
			 console.log("success");
            disconnectServer();
        });
    }).on('error', function(e) {
        console.log("error: " + e.message);
        disconnectServer();
    });
}

function getTextFromServer() {
	var options = {
        hostname: IP,
        port: PORT,
        path: "/gettext?text="+text,
        agent: false
    };
    var req = http.get(options, function(res) {
		var text = "";
        res.on('data', function(t) {
			text += t;
		}).on('end', function(){
			console.log(t);
			copy(t);
            disconnectServer();
        });
    }).on('error', function(e) {
        console.log("error: " + e.message);
        disconnectServer();
    });
}

function disconnectServer() {
    var options = {
        hostname: IP,
        port: PORT,
        path: "/disconnect",
        agent: false
    };
    var req = http.get(options, function(res) {
        res.on('end', function(){
           console.log("finish");
        });
    }).on('error', function(e) {
        console.log("error: " + e.message);
    });
}

var params = process.argv.slice(2);
if (params[0] == 'put') {
    var files = params.slice(1);
    for (var i in files) {
        postFileToServer(files[i], files.length);
    }
} else if (params[0] == 'get') {
    var files = params.slice(1);
    for (var i in files) {
        getFileFromServer(files[i], files.length);
    }
} else if (params[0] == 'putttext') {
    var text = params.slice(1);
	if (!text) {
		paste(function(t) {
			putTextToServer(t);
		});
	} else {
		putTextToServer(text);
	}
} else if (params[0] == 'getttext') {
    getTextFromServer();
} else {
    console.log("Usage: put/get files folders");
    console.log("     xf put xx.txt xx");
    console.log("     xf get xx.txt xx");
    console.log("     xf putttext text");
    console.log("     xf gettext");
}
