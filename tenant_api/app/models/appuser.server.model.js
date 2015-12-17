var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PropertySchema = new Schema ({
  // _id: Number,
  post_code: String,
  street_name: String,
  landlord_name: String,
  landlord_contact_details: String,
  contract_start: Date,
  contract_end :Date,
  property_type: String,
  number_of_flatmates: String,
  monthly_cost: Number,
  deposit_amount: Number,
  inclusive: Boolean
});

var AppUserSchema = new Schema({
    name: {type: String, required: true },
    profile_picture: String,
    properties: [{ type: Schema.Types.ObjectId, ref: 'Property' }],
    connections: [{ type: Schema.Types.ObjectId, ref: 'AppUser' }]
});


var AppUser = mongoose.model('AppUser', AppUserSchema);

var Property = mongoose.model('Property', PropertySchema);

// "_id" : ObjectId("5672ee0f85cd7d164c20dff4"),
