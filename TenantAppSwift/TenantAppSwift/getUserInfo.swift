//
//  getUserInfo.swift
//  testApitTenant
//
//  Created by Mattia on 21/12/2015.
//  Copyright © 2015 Mattia. All rights reserved.
//

import Foundation

class getUserInfo {
    
    func getUser() {
        
        
        let path = "https://housematey.herokuapp.com/users"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            
            for (index, object) in json {
                let firstName = object["firstName"].stringValue
                let lastName = object["lastName"].stringValue
                
                
                if firstName == "Mattia" && lastName == "Assogna" {
                    let id = object["_id"].stringValue
                    print("user id: \(firstName, id)")
                    self.getUserPropertyId(id)
                }
            }
        }
        
        task.resume()
        
    }
    
    func getUserPropertyId(id: String) {
        
        let path = "https://housematey.herokuapp.com/users/\(id)"
        print("user path: \(path)")
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            let properties = json["properties"]
           
            
            if properties.isEmpty {
                print("No properties")
                
            } else {
                
            
                for (index, object) in properties {
               
                    print("user number of properties: \(properties.count)")
                    print("user properties: \(properties)")
                    
                    let propertiesId = object["_id"].stringValue
                    print(propertiesId)
                    
                    self.getUserProperties(propertiesId)
                }
            }

            
    }
        task.resume()
    
}
    
    func getUserProperties(id: String) {
        
        
        let path = "https://housematey.herokuapp.com/properties/\(id)"
        print(path)
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            let postCode = json["post_code"].string
            print("user property post code \(postCode)")
        }
    
    
    task.resume()
    }
}

    