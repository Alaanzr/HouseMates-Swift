//
//  SignupViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 26/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var usernameSignUp: UITextField!
    @IBOutlet weak var firstnameSignUp: UITextField!
    @IBOutlet weak var lastnameSignUp: UITextField!
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
        
    }
    
    @IBAction func signup(sender: UIButton) {
        let username:NSString = usernameSignUp.text!
        let firstname:NSString = firstnameSignUp.text!
        let lastname:NSString = lastnameSignUp.text!
        let email:NSString = emailSignUp.text!
        let password:NSString = passwordSignUp.text!
        
        if ( username.isEqualToString("") || firstname.isEqualToString("") || lastname.isEqualToString("") || email.isEqualToString("") || password.isEqualToString("") ) {
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter account information"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()

        } else {
            do {
                
                let postEndpoint: String = "https://housematey.herokuapp.com/users/"
                let url = NSURL(string: postEndpoint)!
                let session = NSURLSession.sharedSession()
                let postParams : [String: AnyObject] = ["provider": "local", "username": username, "firstName": firstname, "lastName": lastname, "email": email,"password": password]
                
                
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

                    if let json = JSON(data: data!) as? JSON {
                        // Print what we got from the call
                        print("POST: \(json)")
                        //                self.performSelectorOnMainThread("updatePostLabel:", withObject: postString, waitUntilDone: false)
//                    NSUserDefaults.standardUserDefaults().setObject(json["_id"].stringValue, forKey: "LoggedInUserId")
                    }
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.setLoggedUserId(JSON(data: data!))
                        self.performSegueWithIdentifier("SignUpComplete", sender: self)
                    })
                    
                    
                }).resume()
            }
        }
    }
    
    func setLoggedUserId(json: JSON) {
        
        let loggedUser = LoggedUser.sharedInstance
        
        loggedUser.id = json["_id"].stringValue
        loggedUser.username = json["username"].stringValue
        loggedUser.firstname = json["firstName"].stringValue
        loggedUser.lastname = json["lastName"].stringValue
        
        
    }

}
