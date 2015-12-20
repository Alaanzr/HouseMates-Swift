//
//  ViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 17/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        createUser()
        deleteUser()
        getUserInfo()
        createUser()
        createUserProperty()
        createNewConnection("5676d0614feb521100ee84d5")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    // GET: retrieve user information
    
    func getUserInfo() {
        
        let path: String = "https://housematey.herokuapp.com/appusers/567441b104dabd110041f851"
        let url = NSURL(string: path)!
        let session = NSURLSession.sharedSession()
        
        // Make the GET call
        let task = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            
            do {
                if let userString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                     print(data)
                
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                    
                    dispatch_async(dispatch_get_main_queue(),{
                      self.setUserLabel(jsonData)
                    })
                    
                }
                
            } catch {
                print("bad things happened")
            }
           
        })
        
        task.resume()
    }
    
    
    func setUserLabel(jsonData: NSDictionary) {
        
        let userName = jsonData["name"]
        let userPicture = jsonData["picture"]
        let userConnectionCount = jsonData["connections"]!.count
        let userProperties = jsonData["properties"]
        
        // print will be replaced by userNameLabel.text = UserName etc. when labels are created
        
        print(userName)
        print(userPicture)
        print(userConnectionCount)
        
        
        for property in (userProperties as? [AnyObject])! {
            print(property["post_code"])
            print(property["street_name"])
        }
        
    }


    // POST: create new user
    
   func createUser() {
    
        let session = NSURLSession.sharedSession()
        let newUserPost: NSDictionary = ["name": "Marco Polo", "profile_picture": "mypicture.jpg"]
        let path: String = "https://housematey.herokuapp.com/appusers"
        let url = NSMutableURLRequest(URL: NSURL(string: path)!)
        url.HTTPMethod = "POST"
    
    // set new post as HTTPBody for request
    url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    do {
        url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newUserPost, options: NSJSONWritingOptions())
        print(newUserPost)

    } catch {
        print("bad things happened")
    }
    
    // Make the POST call and handle it in a completion handler
        let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
        // Make sure we get an OK response
        guard let realResponse = response as? NSHTTPURLResponse where
            realResponse.statusCode == 200 else {
                print("Not a 200 response")
                return
        }
        
        // Read the JSON
        if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
            // Print what we got from the call
            print("POST: " + postString)
            
        }
        
    })
        task.resume()
    }
    
    func deleteUser() {
        
        
        let deleteUser: String = "https://housematey.herokuapp.com/appusers/5676d0614feb521100ee84d5"
        let deleteUserRequest = NSMutableURLRequest(URL: NSURL(string: deleteUser)!)
        deleteUserRequest.HTTPMethod = "DELETE"
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(deleteUserRequest, completionHandler: {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on /user")
                return
            }
        })
        task.resume()
    }



// POST: create new property for a user

func createUserProperty() {
    
    let session = NSURLSession.sharedSession()
    let newPropertyPost: NSDictionary = ["post_code":"W8 5JA","street_name":"Gun Road","landlord_name":"Mr Fokker","landlord_contact_details":"555 777 999","property_type":"Flat","number_of_flatmates":5,"monthly_cost":200,"deposit_amount":200,"inclusive":false,"__v":0]
    let path: String = "https://housematey.herokuapp.com/properties"
    let url = NSMutableURLRequest(URL: NSURL(string: path)!)
    url.HTTPMethod = "POST"
    
    // set new post as HTTPBody for request
    url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    do {
        url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newPropertyPost, options: NSJSONWritingOptions())
        print(newPropertyPost)
        
        
    } catch {
        print("bad things happened")
    }
    
    // Make the POST call and handle it in a completion handler
    let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        
        // Make sure we get an OK response
        guard let realResponse = response as? NSHTTPURLResponse where
            realResponse.statusCode == 200 else {
                print("Not a 200 response")
                return
        }
        
        // Read the JSON
        if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
            // Print what we got from the call
            print("POST: " + postString)
            
        }
        
        let post: NSDictionary
        
        do { post = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
            
            dispatch_async(dispatch_get_main_queue(),{
                let propertyId = post["_id"] as! String
                self.assignNewProperty(propertyId)
            })
                } catch {
                print("error parsing response from post")
        }
    })
    task.resume()
}
    
    
    // PUT: assign property to user
    
    func assignNewProperty(propertyId: String) {
        
        let session = NSURLSession.sharedSession()
        let newPropertyPut: NSDictionary = ["properties": [propertyId]]
        let path: String = "https://housematey.herokuapp.com/appusers/567441b104dabd110041f851"
        let url = NSMutableURLRequest(URL: NSURL(string: path)!)
        url.HTTPMethod = "PUT"
        
        // set new post as HTTPBody for request
        url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newPropertyPut, options: NSJSONWritingOptions())
            print(newPropertyPut)
            
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            if let putString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("PUT: " + putString)
                
            }
            
        })
        task.resume()
    }

    // PUT: assign connection to user
    
    func createNewConnection(userId: String) {
        
        let session = NSURLSession.sharedSession()
        let newConnectionPut: NSDictionary = ["connections": [userId]]
        let path: String = "https://housematey.herokuapp.com/appusers/567441b104dabd110041f851"
        let url = NSMutableURLRequest(URL: NSURL(string: path)!)
        url.HTTPMethod = "PUT"
        
        // set new post as HTTPBody for request
        url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newConnectionPut, options: NSJSONWritingOptions())
            print(newConnectionPut)
            
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            if let putString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("PUT: " + putString)
                
            }
            
        })
        task.resume()
    }

}



