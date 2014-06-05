var express = require('express')
  , http = require('http')
  , path = require('path');
var app = express();
// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(path.join(__dirname, 'public')));
var UserManager = require('./userManager').UserManager;
var userManagerService = new UserManager(app);
http.createServer(app).listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
    console.log('URL : http://localhost:300');
    console.log('Method : GET');
    console.log('Get all user list : /users');
});