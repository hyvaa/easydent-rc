//
// easydent-rc.js
//
// node.js web server just to run local file
//
// programming by hyvaasoft@gmail.com


var http = require('http');
var express = require('express');
var app = express();
var process = require('child_process');


app.get('/api/pid-pano/:pid', function (request, response) {  //chart number

	var chn = request.param('pid');
	var res;
	var cmd = 'c:\\easydent-rc\\easydent-rc-pid-pano.exe '+chn;
	console.log(cmd);
	process.exec(cmd ,  function (error, stdout, stderr) {
		res = stdout;
	});

	response.header("Access-Control-Allow-Origin","*");	
	response.send({res: res});
});

app.get('/api/ping', function (request, response) {
	responseeee.send(1);
});





http.createServer(app).listen(52273, function() {
	console.log('server running...');
});
