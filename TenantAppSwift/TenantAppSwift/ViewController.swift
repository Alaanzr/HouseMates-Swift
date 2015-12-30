//
//  ViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 17/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, NSURLConnectionDataDelegate {

    // Sign In text field outlets
    
    @IBOutlet weak var usernameSignIn: UITextField!
    
    @IBOutlet weak var passwordSignIn: UITextField!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
//            createService().createUser()
//            createService().createProperty()
//            editService().editUser()
//            editService().editProperty()
//            getService().getUser()
//            deleteService().deleteUser()
        

        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    
    // Sign In action
    
    
    @IBAction func signin(sender: UIButton) {
//        let PasswordString = "\(usernameSignIn.text):\(passwordSignIn.text)"
//        let PasswordData = PasswordString.dataUsingEncoding(NSUTF8StringEncoding)
//        let base64EncodedCredential = PasswordData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
//        
//        let urlPath : String = "https://housematey.herokuapp.com/api/signin"
//        var url: NSURL = NSURL(string: urlPath)!
//        
//        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
//        request.setValue("Basic \(base64EncodedCredential)", forHTTPHeaderField: "Authorization")
//        request.HTTPMethod = "GET"
//        
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//            
//            
//            guard let realResponse = response as? NSHTTPURLResponse where
//                realResponse.statusCode == 200 else {
//                    print("Not a 200 response")
//                    return
//            }
//            
//            // Read the JSON
//            
//            do {
//                if let userString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
//                    print(data)
//                    
//                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
//                    
//                }
//                
//            } catch {
//                print("bad things happened")
//            }
//            
//        })
        
        self.performSegueWithIdentifier("SignInComplete", sender: self)
        
    }
    
    
        
    }



