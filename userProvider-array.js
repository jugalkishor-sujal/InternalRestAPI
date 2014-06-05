var Datastore = require('nedb')
  , db = new Datastore({ filename: '/model/db/datafile.db' });
db.loadDatabase(function (err) {    // Callback is optional
    // Now commands will be executed
});

var nextUserId = 1;
UserProvider = function () {
    this.users = [];
    this.fetchAllUsers = function (cb) {
        cb(null, this.users);
    };
    this.fetchUserById = function (id, cb) {
        var foundUsers = this.users.filter(function (user) { return user._id == id });
        if (foundUsers.length == 0) {
            cb('User not found', null);
        } else {
            cb(null, foundUsers[0]);
        }
    };
    this.insertUser = function (user, cb) {
        user.code = nextUserId++;
        this.users.push(user);
        cb(null, user);

        db.insert(user, function (err, newUser) {   // Callback is optional
            console.log("Inserted User :");
            console.log(newUser);
            // newDoc is the newly inserted document, including its _id
            // newDoc has no key called notToBeSaved since its value was undefined
            
        });
    };
    this.updateUser = function (user, cb) {
        this.fetchUserById(user._id, function (error, _user) {
            if (error) {
                cb(error, null);
            } else {
                _user.name = user.name;
                _user.city = user.city;
                _user.state = user.state;
                cb(null, _user);
            }
        });
    };
    this.deleteUser = function (id, cb) {
        this.users = this.users.filter(function (user) { return user._id != id });
        cb(null, { _id: id });
    };
};
exports.UserProvider = UserProvider;