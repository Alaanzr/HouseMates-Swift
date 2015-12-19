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
}