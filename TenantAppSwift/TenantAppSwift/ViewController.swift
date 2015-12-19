//
//  ViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 17/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var propertyInfo = [String: AnyObject]()
    
    @IBOutlet weak var userPicture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        createUser()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

  }


// PUT: create new property for a user

//func createUserConnection() {
//    
//    let session = NSURLSession.sharedSession()
//    let newUserPropertyPut: NSDictionary = ["name": "Marco Polo", "profile_picture": "mypicture.jpg"]
//    let path: String = "https://housematey.herokuapp.com/appusers"
//    let url = NSMutableURLRequest(URL: NSURL(string: path)!)
//    url.HTTPMethod = "POST"
//    
//    // set new post as HTTPBody for request
//    url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//    do {
//        url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newUserPost, options: NSJSONWritingOptions())
//        print(newUserPost)
//        
//    } catch {
//        print("bad things happened")
//    }
//    
//    // Make the POST call and handle it in a completion handler
//    let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
//        
//        // Make sure we get an OK response
//        guard let realResponse = response as? NSHTTPURLResponse where
//            realResponse.statusCode == 200 else {
//                print("Not a 200 response")
//                return
//        }
//        
//        // Read the JSON
//        if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
//            // Print what we got from the call
//            print("POST: " + postString)
//            
//        }
//        
//    })
//    task.resume()
//}


}



