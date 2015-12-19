//
//  crudPropertyService.swift
//  TenantAppSwift
//
//  Created by Mattia on 19/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import Foundation

class crudProperty {


func getUser() {
    
    
    let path = "https://housematey.herokuapp.com/appusers"
    let url = NSURL(string: path)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        
        let json = JSON(data: data!)
        
        let name = json[1]["name"]
        print(name)
    }
    
    task.resume()
    
    }
    
    
    func postDataToURL() {
        
        // Setup the session to make REST POST call
        let postEndpoint: String = "https://housematey.herokuapp.com/properties"
        let url = NSURL(string: postEndpoint)!
        let session = NSURLSession.sharedSession()
        let postParams : [String: AnyObject] = ["post_code": "Hello POST world"]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(postParams)
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
//            if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
//                // Print what we got from the call
//                print("POST: " + postString)
//                self.performSelectorOnMainThread("updatePostLabel:", withObject: postString, waitUntilDone: false)
//            }
            
        }).resume()
    }

}