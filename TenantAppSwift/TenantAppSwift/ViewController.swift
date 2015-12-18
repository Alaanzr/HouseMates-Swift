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
        getUserPropertyId()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Retrieve user information
    
    func getUserPropertyId() {
        
        let path: String = "https://housematey.herokuapp.com/appusers/2/"
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
                    let propertyID = jsonData["properties"]![0]
                   
                    print(propertyID)
                    
                    dispatch_async(dispatch_get_main_queue(),{
                      self.getUserPropertyInfo(propertyID!)
                    })
                    
                }
                
            } catch {
                print("bad things happened")
            }
           
        })
        
        task.resume()
    }
    
    func getUserPropertyInfo(id: AnyObject) {
        
        let path: String = "https://housematey.herokuapp.com/properties/\(id)"
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
                    
                    print(jsonData["deposit_amount"])
                    
                    
                }
                
            } catch {
                print("bad things happened")
            }
            
        })
        
        task.resume()
    }
    
}




