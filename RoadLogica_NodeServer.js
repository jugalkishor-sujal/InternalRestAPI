
var express = require("express"),
    app = express();                                                                             
var fs = require('fs');
var path = require('path');
var http = require('http');

// tell express to use the bodyParser middleware                                                 
// and set upload directory     

app.set('port', process.env.PORT || 3000);                    

app.use(function (req, res, next) {
    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');
    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.JSON = true;
    // Pass to next layer of middleware
    next();
});

//user
var user = require('./routes/user');
app.get('/user/get', user.get);
//app.post("/user/add", user.add);
//app.post('/user/update', user.update);
//app.post("/user/delete", user.delete);

app.listen(app.get('port'));

console.log("server is started on"+app.get('port'));

