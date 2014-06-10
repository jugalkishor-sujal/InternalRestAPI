var Datastore = require('nedb')
  , db = new Datastore({ filename: '/model/db/datafile.db' });
db.loadDatabase(function (err) {    // Callback is optional
    // Now commands will be executed
});

var nextUserId = 1;
exports.get = function (req, response) {
    try {
        var user = {
            "email": req.body.email//,
            //"encrypted_password": _encrypted_password,
            //"reset_password_token": _reset_password_token,
            //"reset_password_sent_at": _reset_password_sent_at,
            //"remember_created_at": _remember_created_at,
            //"sign_in_count": _sign_in_count,
            //"current_sign_in_at": _current_sign_in_at,
            //"last_sign_in_at": _last_sign_in_at,
            //"current_sign_in_ip": _current_sign_in_ip,
            //"last_sign_in_ip": _last_sign_in_ip,
            //"user_type_id": _user_type_id,
            //"created_at": _created_at,
            //"updated_at": _updated_at,
            //"first_name": _first_name,
            //"last_name": _last_name,
            //"mobile": _mobile,
            //"tel": _tel,
            //"address": _address,
            //"description": _description,
            //"website": _website,
            //"cover_file_name": _cover_file_name,
            //"cover_file_size": _cover_file_size,
            //"cover_content_type": cover_content_type
        };
        user.code = nextUserId++;
        
        db.insert(user, function (err, newUser) {   // Callback is optional
            console.log("Inserted User :");
            console.log(newUser);
            if (!err) {
                response.send({
                    Response: newUser
                });
                response.end();
            }
            // newDoc is the newly inserted document, including its _id
            // newDoc has no key called notToBeSaved since its value was undefined

        });
    }
    catch (ex) { console.log("\n Exception #" + ex); response.send({ Response: ex }); response.end(); }
};