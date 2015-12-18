# Tenant-App

### User Stories - Listed in order of importance

##### 1 - Profiles
- Creating and displaying user profiles.

##### 2 - GPS Search
- Map users by current location.

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

/properties/property_id/appusers                  :list of users for a specific property
/appusers/appuser_id/connections                  :list of connections(friends) for a specific user
/appusers/appuser_id/connection_id                :specific connection for a specific user
/appusers/appuser_id/connection_count             :count of number of connections for a specific user
/appusers/appuser_id/property_count               :count of properties for a specific user



Are there any others you need?
```


