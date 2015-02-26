var express = require('express'),
    http = require('http')
    path = require('path'),
    fs = require('fs'),
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

app.get('/disconnect', function(req, res){
    res.send("success");
    setTimeout(function(){process.exit();}, 100);
});


http.createServer(app).listen(app.get('port'), function(){
    console.log("Express server http://localhost:" + app.get('port'));
});
