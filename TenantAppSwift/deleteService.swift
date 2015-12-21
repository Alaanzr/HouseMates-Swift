//
//  deleteService.swift
//  TenantAppSwift
//
//  Created by Mattia on 21/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import Foundation

class deleteService {
    
    func deleteUser() {
        
        
                let deleteUser: String = "https://housematey.herokuapp.com/users/56783d6e7f47911100f5c48b"
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
        

}