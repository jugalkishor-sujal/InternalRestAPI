var Datastore = require('nedb')
  , db = new Datastore({ filename: '/model/db/datafile.db' });
db.loadDatabase(function (err) {    // Callback is optional
    // Now commands will be executed
});

UserManager = function (app) {
  var UserProvider = require('./userProvider-array').UserProvider;
  var userProvider = new UserProvider();
  userProvider.insertUser({_id:1,email:'jugal.lalriya@gmail.com'}, function(a,b){});
  
  app.get('/users', function(req, res) {
    userProvider.fetchAllUsers(function(error, users) {
      res.send(users);
    });
  });
  app.post('/users', function (req, res) {
      console.log(req.body);
      var _user = {
          "email": ''//req.body.email//,
          //"encrypted_password": req.encrypted_password,
          //"reset_password_token": req.reset_password_token,
          //"reset_password_sent_at": req.reset_password_sent_at,
          //"remember_created_at": req.remember_created_at,
          //"sign_in_count": req.sign_in_count,
          //"current_sign_in_at": req.current_sign_in_at,
          //"last_sign_in_at": req.last_sign_in_at,
          //"current_sign_in_ip": req.current_sign_in_ip,
          //"last_sign_in_ip": req.last_sign_in_ip,
          //"user_type_id": req.user_type_id,
          //"created_at": req.created_at,
          //"updated_at": req.updated_at,
          //"first_name": req.first_name,
          //"last_name": req.last_name,
          //"mobile": req.mobile,
          //"tel": req.tel,
          //"address": req.address,
          //"description": req.description,
          //"website": req.website,
          //"cover_file_name": req.cover_file_name,
          //"cover_file_size": req.cover_file_size,
          //"cover_content_type": req.cover_content_type
      };
      userProvider.insertUser(_user, function (error, user) {
      if (error) {
        res.send(error, 500);
      } else {
        res.send(user);
      }
    });
  });
  app.get('/users/:id', function(req, res) {
    userProvider.fetchUserById(req.params.id, function(error, user) {
      if (user == null) {
        res.send(error, 404);
      } else {
        res.send(user);
      }
    });
  });
  app.post('/users/:id', function (req, res) {

      var _user = {
          "email": req.email,
          "encrypted_password": req.encrypted_password,
          "reset_password_token": req.reset_password_token,
          "reset_password_sent_at": req.reset_password_sent_at,
          "remember_created_at": req.remember_created_at,
          "sign_in_count": req.sign_in_count,
          "current_sign_in_at": req.current_sign_in_at,
          "last_sign_in_at": req.last_sign_in_at,
          "current_sign_in_ip": req.current_sign_in_ip,
          "last_sign_in_ip": req.last_sign_in_ip,
          "user_type_id": req.user_type_id,
          "created_at": req.created_at,
          "updated_at": req.updated_at,
          "first_name": req.first_name,
          "last_name": req.last_name,
          "mobile": req.mobile,
          "tel": req.tel,
          "address": req.address,
          "description": req.description,
          "website": req.website,
          "cover_file_name": req.cover_file_name,
          "cover_file_size": req.cover_file_size,
          "cover_content_type": req.cover_content_type
      };
    _user._id = req.params.id;
    userProvider.updateUser(_user, function(error, user) {
      if (user == null) {
        res.send(error, 404);
      } else {
        res.send(user);
      }
    });
  });
  app.delete('/users/:id', function(req, res) {
    userProvider.deleteUser(req.params.id, function(error, user) {
      if (user == null) {
        res.send(error, 404);
      } else {
        res.send(user);
      }
    });
  });
};
exports.UserManager = UserManager;