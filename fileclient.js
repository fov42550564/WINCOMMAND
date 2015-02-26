var http = require('http'),
    path = require('path'),
    fs = require('fs'),
    JSZip = require('jszip'),
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
} else {
    console.log("Usage: put/get files folders");
    console.log("     xf put xx.txt xx");
    console.log("     xf get xx.txt xx");
}
