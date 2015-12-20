# Tenant-App

### User Stories - Listed in order of importance

##### 1 - Profiles
- Creating and displaying user profiles.
- Two types of profile display:
 - SUMMARY for public profile with summary of user's employment, rental resume and interests.  For example, 'No picture', Pastry chef (female 20 -30) working in Zone 1 living in Zone 2 sharing house paying £500-800 pcm with 4-5 year rental history covering house and flat shares.  WANTED any Zone 2 to 4 location house or flat £400-800 pcm.  Deposit no more than £800. One month notice. Interests heavy metal and skiing.  If OFFERING then also include property details and other sharers profiles but maybe this is phase II.
 - DETAILED for connections (people that are proposing to share accomodation). 
 
 - For example:
  * Potrait profile picture
  * Profile description 'age', relationship status, nationality/languages, bio (max 100 words)
   * Summary of work history from linkedin / entered by user, include work locations.
   * Current accommodation details, address, rent, deposit, notice, how many sharers, property type, landlord reference or contact details.
   * Rental history details (last 3 years), rent, address, how many sharers, property type, landlord reference or contact.
   * Interests, qualifications, memberships
   * More pictures.

##### 2 - GPS Search
- Map users by current location. Aim to visualise unfimilar location using map.

##### 3 - Document Store 
- Facilitate document storage for the user.

##### 4 - Messaging
- Allow tenants to to be able to communicate with other tenants.

##### 5 - Profile Search 
- Map users by targeted area (can be split into Search v1.0 and v2.0).

##### 6 - Recommendations 
- Review other user's profiles.

##### 7 - Endorsements 
- Endorse other user's profiles.

##### 8 - Account 
- Can only view other profiles after having signed up.

##### 9 - Guide 
- Provide guidance on how to be a successful tenant.

##### 10 - Wall 
- Tenants can share info on their own space/wall.

##### 11 - Knowledgebase 
- Tenants knowledgebase for renting.

##### UPDATE:
- Connections: Users can 'connect' with each other, which allows a user to leave recommendations and endorsements.
- 

**Backend Hello World**

Three options for ios backend:
 1. [Firebase](https://www.firebase.com/docs/ios/examples.html) 
 2. NodeJS:
  1. [How to Write An iOS App that Uses a Node.js/MongoDB Web Service](http://www.raywenderlich.com/61264/write-ios-app-uses-node-jsmongodb-web-service)
  2. [Mobile Developers – Easily Build a Backend REST API with Node.js](http://www.iosinsight.com/backend-rest-api-nodejs/)
 3. [Parse](https://parse.com/docs/ios/guide)
 4. 
 

##### Data Model
```
var User = new Schema({
 name :  String,
 profile_picture : String,
 properties : [Properties],
 connections : [User]
});

var Properties = new Schema({
 address : String,
 post_code : String,
 landlord_name : String,
 landlord_contact : String,
 contract_start : Date,
 contract_end : Date,
 property_type : String,
 number_of_flatmates : String,
 monthly_cost : Number,
 deposit_amount : Number,
 inclusive : [Boolean]
});
```

***Suggested API Calls***
```
/appusers                                         :list of all app users - DONE GET, POST
/properties                                       :list of all properties - DONE GET, POST
/appusers/appuser_id                              :app user object for specific id - DONE GET, UPDATE, DELETE
/properties/property_id                           :project object for specific id - DONE GET, UPDATE, DELETE
/appusers_properties/appuser_id                   :list of properties for a specific user - DONE GET


example update of user connection:
http verb: PUT  url: http://localhost:1337/appusers/56743397aa3babfd5bd45a8b 
body: 
{
  "connections": ["56743384aa3babfd5bd45a8a"]
}


example post of new user:
http verb: POST  url:https://hxxxxxxxx.herokuapp.com/appusers
body:
{
  "name": "Mattia Assogna",
  "profile_picture": "mypingpongpicture.jpg",
  "connections": [],
  "properties": ["5674404004dabd110041f850","56743f5004dabd110041f84e"]
}


example post of new property:
http verb: POST  url: https://hxxxxxxx.herokuapp.com/properties
body:
{
  "post_code": "AB1 0MG",
  "street_name": "High Road",
  "landlord_name": "Mr Fixer",
  "landlord_contact_details": "555 777 911",
  "property_type": "Flat",
  "number_of_flatmates": 1,
  "monthly_cost": 299,
  "deposit_amount": 200,
  "inclusive": false
}


example post of deleting property:
http verb: DELETE  url: http://localhost:1337/appusers/56743397aa3babfd5bd45a8b 

Are there any others you need?
```


