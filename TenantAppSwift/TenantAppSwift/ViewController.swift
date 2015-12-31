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
    // username ezzyetest
    // password ezzyetest
    
    
    @IBAction func signin(sender: UIButton) {
        
        
//        print("userName: \(usernameSignIn.text!)")
//        print("password: \(passwordSignIn.text!)")
//        
//        //set end point
//        let postEndpoint: String = "https://housematey.herokuapp.com/api/signin"
//        let url = NSURL(string: postEndpoint)!
//        let session = NSURLSession.sharedSession()
//        
//        
//        print("postEndPoint: \(postEndpoint)")
//        print("url: \(url)")
//        print("session: \(session)")
//        
//        // Create the request
//        let request = NSMutableURLRequest(URL: url)
//        request.HTTPMethod = "GET"
//        // No body needed
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        // However header needed
//        request.setAuthorizationHeader(username: usernameSignIn.text!, password: passwordSignIn.text!)
//        
//        print("HTTPMethod: \(request.HTTPMethod)")
//        
//        // Make the GET call and handle it in a completion handler
//        session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error:NSError?) -> Void in
//            // Make sure we get an OK response
//            guard let response = response as? NSHTTPURLResponse where
//                response.statusCode == 200 else {
//                    print("Not a 200 response")
//                    return
//            }
//            
//            // Read the JSON
//            if let jsonString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
//                // Print what we got from the call
//                print("GET: " + jsonString)
//                //                self.performSelectorOnMainThread("updatePostLabel:", withObject: postString, waitUntilDone: false)
//            }
//            
//        }).resume()
//        
//    }
//    
//    
//}
//
//extension NSMutableURLRequest {
//    func setAuthorizationHeader(username username: String, password: String) -> Bool {
//        guard let data = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding) else { return false }
//        
//        let base64 = data.base64EncodedStringWithOptions([])
//        setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
//        return true
        
        self.performSegueWithIdentifier("SignInComplete", sender: self)
        
        
    }
}

