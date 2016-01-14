var http = require('http');
var querystring = require('querystring');
var url = require('url');
var express = require('express');
var app = express();
var faye = require('faye');
var server = http.createServer(app);
var mongoDB = require('mongoskin');


var bayeux = new faye.NodeAdapter({
    mount: '/faye',
    timeout: 45
});

bayeux.attach(server);
var pubClient = bayeux.getClient();

app.configure(function () {

    app.use(express.static( __dirname + '/public'));
    app.use(express.json());
    app.use(express.urlencoded());
    
});

var db = mongoDB.db('mongodb://localhost/SwimFit?auto_reconnect=true', {
    safe: true
});

app.get('/teamGet', function (req, res, next){
    
    
    db.bind("team");
    var daba = db.team;
    
    daba.findItems(function(error, result) {
        if(error)
            next(error);
        else {
            res.writeHead(200, {
                'Content-Type': 'application/json'
            });
            res.end(JSON.stringify(result));
        } 
    });
});

app.get('/Modulliste', function (req, res, next)
{
    db.bind("Modul");
    var daba = db.Modul;
    
    daba.findItems(function(error, result) {
        if(error)
            next(error);
        else {
            res.writeHead(200, {
                'Content-Type': 'application/json'
            });
            res.end(JSON.stringify(result));
        } 
    });
});

app.get('/schwimmerliste', function (req, res, next)
{
    db.bind("Schwimmer");
    var daba = db.Schwimmer;
    
    daba.findItems(function(error, result) {
        if(error)
            next(error);
        else {
            res.writeHead(200, {
                'Content-Type': 'application/json'
            });
            res.end(JSON.stringify(result));
        } 
    });
});

app.post('/Modulliste', function (req, res, next)
{
    db.bind("Modul");
    var daba = db.Modul;
    
    daba.insert(req.body, function(error, Modul) {
        if(error) next(error);
    });
    
    var publication = pubClient.publish('/Modul', req.body);
	
    publication.then(function() {
        res.writeHead(200, 'OK');
        res.end();
    }, function(error) {
        next(error);
    });
    
    console.log(req.body.name + ' ist ein neues Schwimmmodul');
    
});

app.post('/schwimmerliste', function (req, res, next)
{
    db.bind("Schwimmer");
    var daba = db.Schwimmer;

    daba.insert(req.body, function(error, Schwimmer) {
        if(error) next(error);
    });
    
    var publication = pubClient.publish('/Schwimmer', req.body);
	
    publication.then(function() {
        res.writeHead(200, 'OK');
        res.end();
    }, function(error) {
        next(error);
    });
    
    console.log(req.body.name+ ' ist ein neuer Schwimmer');
    
});
app.post('/teamPost', function (req, res, next){
    
    
    db.bind("team");
    var daba = db.team;
    
    daba.insert(req.body, function(error, team) {
		if(error) next(error);
	});
    
	var publication = pubClient.publish('/team', req.body);
	
	publication.then(function() {
		res.writeHead(200, 'OK');
		res.end();
	}, function(error) {
		next(error);
	});
    
    livetick(req.body.name + ' nimmt am Tunier teil', res, next);
});



    
server.listen(3000);
