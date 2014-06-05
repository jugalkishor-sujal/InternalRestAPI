//var Datastore = require('nedb')
//  , db = new Datastore();

var Datastore = require('nedb')
  , db = new Datastore({ filename: '/model/db/datafile.db' });
db.loadDatabase(function (err) {    // Callback is optional
    // Now commands will be executed
});

var auctions =
    {
    "start_at": 'world',
    "end_at": 5,
    "start_price":5,
    "min_step_price": 1,
    "current_price": 2,
    "winner": '',
    "product_id": 1,
    "status": true,
    "created_at": new Date(),
    "updated_at": new Date()
    };

var bids =
    {
    "bidder_id": "",
    "bid_amount": "",
    "auction_id": "",
    "created_at": "",
    "updated_at": ""
    };

var products=
    {
        "name": "",
        "user_id": "",
        "format_id": "",
        "form_factor_id": "",
        "time_share_id": "",
        "duration": "",
        "grade_id": "",
        "product_type_id": "",
        "period_id": "",
        "expiry_date": "",
        "start_at": "",
        "position_id": "",
        "price": "",
        "created_at": "",
        "updated_at": "",
        "description": "",
        "cover_file_name": "",
        "cover_content_type": "",
        "cover_file_size":""
};

var taggings=
    {
        "tag_id": "",
        "taggable_id": "",
        "taggable_type": "",
        "tagger_id": "",
        "tagger_type": "",
        "context": "",
        "created_at": ""
    };

var tags = {
    "name": "",
    "taggings_count": ""
};
var user_types = {
    "name": "",
    "created_at": "",
    "updated_at": ""
};

var users = {
    "email": "",
    "encrypted_password": "",
    "reset_password_token": "",
    "reset_password_sent_at": "",
    "remember_created_at": "",
    "sign_in_count": "",
    "current_sign_in_at": "",
    "last_sign_in_at": "",
    "current_sign_in_ip": "",
    "last_sign_in_ip": "",
    "user_type_id": "",
    "created_at": "",
    "updated_at": "",
    "first_name": "",
    "last_name": "",
    "mobile": "",
    "tel": "",
    "address": "",
    "description": "",
    "website": "",
    "cover_file_name": "",
    "cover_file_size": "",
    "cover_content_type": ""
};



db.insert(doc, function (err, newDoc) {   // Callback is optional
    console.log("Inserted");
    // newDoc is the newly inserted document, including its _id
    // newDoc has no key called notToBeSaved since its value was undefined
});

db.find({}, function (err, docs) {
    console.log(docs);
    // docs is an array containing documents Mars, Earth, Jupiter
    // If no document is found, docs is equal to []
});