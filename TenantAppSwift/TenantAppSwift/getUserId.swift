//
//  getUserId.swift
//  TenantAppSwift
//
//  Created by Mattia on 21/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import Foundation

class getUserId {
    
    func getUser() {
        
        
        let path = "https://housematey.herokuapp.com/users"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            var count = 1
            
            for (index, object) in json {
                let firstName = object["firstName"].stringValue
                let lastName = object["lastName"].stringValue
                
                print("user \(count): \(firstName, lastName)")
                count += 1
                
                if firstName == "Mattia" && lastName == "Assogna" {
                    let id = object["_id"].stringValue
                    let properties = object["properties"]
                    let connections = object["connections"]
                    print("user searched: \(firstName), ID: \(id)")
                    
                    for (index, object) in connections {
                        let connection = object["fullName"]
                        print("User connections: \(connection)")
                    }
                    
                    if properties.isEmpty {
                        print("No properties")
                        
                    } else {
                        
                        for (index, object) in properties {
                            print(object)
                        }
                    }
                }
            }

        }
        
        task.resume()
    }
}