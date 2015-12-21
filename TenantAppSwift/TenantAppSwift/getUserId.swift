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
            
            for (index, object) in json {
                let firstName = object["firstName"].stringValue
                let lastName = object["lastName"].stringValue
                
                if firstName == "Mattia" && lastName == "Assogna" {
                    let id = object["_id"].stringValue
                    let properties = object["properties"]
                    let connections = object["connections"]
                    print("user id: \(firstName, id)")
                    
                        for (index, object) in connections {
                            print(object)
                        }
                    
                        for (index, object) in properties {
                            let cost = object["monthly_cost"].stringValue
                            print("monthly cost: \(cost)")
                            print(object)
                        }
                }
            }
        }
        
        task.resume()
    }
}