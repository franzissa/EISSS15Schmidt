var http = require('http'),
    express = require('express'),
    path = require('path');
    MongoClient = require('mongodb').MongoClient,
	Server = require('mongodb').Server,
	CollectionDriver = require('./collectionDriver').CollectionDriver;
	FileDriver = require('./fileDriver').FileDriver;
 
var app = express();
app.set('port', process.env.PORT || 3000); 
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.bodyParser());


var mongoHost = 'localHost'; 
var mongoPort = 27017; 
var collectionDriver;
var fileDriver;
 
var mongoClient = new MongoClient(new Server(mongoHost, mongoPort)); 
mongoClient.open(function(err, mongoClient) { 
  if (!mongoClient) {
      console.error("Error! Exiting... Must start MongoDB first");
      process.exit(1); 
  }
  var db = mongoClient.db("MyDatabase");  
  collectionDriver = new CollectionDriver(db); 
  fileDriver = new FileDriver(db);
});




app.use(express.static(path.join(__dirname, 'public')));
app.get('/', function (req, res) {
  res.send('<html><body><h1>Hello World</h1></body></html>');
});
 
app.post('/files', function(req,res) {fileDriver.handleUploadRequest(req,res);});
app.get('/files/:id', function(req, res) {fileDriver.handleGet(req,res);});

app.get('/:collection', function(req, res) { 
   var params = req.params; 
   collectionDriver.findAll(req.params.collection, function(error, objs) { //Alle Objecte
    	  if (error) { res.send(400, error); } 
	      else { 
	          if (req.accepts('html')) { 
    	          res.render('data',{objects: objs, collection: req.params.collection}); 
              } else {
	          res.set('Content-Type','application/json'); 
                  res.send(200, objs); 
              }
         }
   	});
});
 
app.get('/:collection', function(req, res, next) {  
   var params = req.params;
   var query = req.query.query;
   if (query) {
        query = JSON.parse(query); 
        collectionDriver.query(req.params.collection, query, returnCollectionResults(req,res)); 
   } else {
        collectionDriver.findAll(req.params.collection, returnCollectionResults(req,res)); 
   }
});
 
function returnCollectionResults(req, res) {
    return function(error, objs) { 
        if (error) { res.send(400, error); }
	        else { 
                    if (req.accepts('html')) { 
                        res.render('data',{objects: objs, collection: req.params.collection});
                    } else {
                        res.set('Content-Type','application/json');
                        res.send(200, objs);
                }
        }
    };
};

app.post('/:collection', function(req, res) { 
    var object = req.body;
    var collection = req.params.collection;
    collectionDriver.save(collection, object, function(err,docs) {
          if (err) { res.send(400, err); } 
          else { res.send(201, docs); } 
     });
});
app.put('/:collection/:entity', function(req, res) { 
    var params = req.params;
    var entity = params.entity;
    var collection = params.collection;
    if (entity) {
       collectionDriver.update(collection, req.body, entity, function(error, objs) { 
          if (error) { res.send(400, error); }
          else { res.send(200, objs); } 
       });
   } else {
       var error = { "message" : "Cannot PUT a whole collection" };
       res.send(400, error);
   }
});

app.delete('/:collection/:entity', function(req, res) { 
    var params = req.params;
    var entity = params.entity;
    var collection = params.collection;
    if (entity) {
       collectionDriver.delete(collection, entity, function(error, objs) { 
          if (error) { res.send(400, error); }
          else { res.send(200, objs); } //C 200 b/c includes the original doc
       });
   } else {
       var error = { "message" : "Cannot DELETE a whole collection" };
       res.send(400, error);
   }
});


app.use(function (req,res) {
    res.render('404', {url:req.url});
});
 
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});