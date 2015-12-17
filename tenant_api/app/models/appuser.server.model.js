var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var AppUserSchema = new Schema({
    name: {type: String, required: true },
    profile_picture: String,
    properties: [Properties],
    connections: [AppUser]
});

mongoose.model('AppUser', AppUserSchema);
