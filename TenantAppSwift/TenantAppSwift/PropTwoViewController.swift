//
//  PropTwoViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 03/01/2016.
//  Copyright © 2016 TenantTeam. All rights reserved.
//

import UIKit

class PropTwoViewController: UIViewController {
    
    let userProperties = UserProperties.sharedInstance

    let loggedUser = LoggedUser.sharedInstance
    
    // Info provided at Sign Up
    
    @IBOutlet weak var loggedUserName: UILabel!
    @IBOutlet weak var loggedFullName: UILabel!
    @IBOutlet weak var loggedEmail: UILabel!
    
    // New Info
    
    @IBOutlet weak var locationArea: UITextField!
    @IBOutlet weak var postCode: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var propertyType: UITextField!
    @IBOutlet weak var contractStart: UITextField!
    @IBOutlet weak var contractEnd: UITextField!
    @IBOutlet weak var landLord: UITextField!
    @IBOutlet weak var landlordContact: UITextField!
    @IBOutlet weak var numberFlatMate: UITextField!
    @IBOutlet weak var rent: UITextField!
    @IBOutlet weak var deposit: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loggedUserName.text = "Username: \(loggedUser.username)"
        self.loggedFullName.text = "\(loggedUser.firstname) \(loggedUser.lastname)"
        self.loggedEmail.text = loggedUser.email
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func savePropOne(sender: UIButton) {
//        createNewProperty("PropOneComplete")
//    }
    
    

    
    @IBAction func submitProfile(sender: UIButton) {
        createNewProperty("SubmitProfileTwo")
    }
    
    
    
    func createNewProperty(segueIdentifier: String) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        let locationarea:NSString = locationArea.text!
        let postcode:NSString = postCode.text!
        let streetname:NSString = streetName.text!
        let propertytype:NSString = propertyType.text!
        let contractstart:NSString = contractStart.text!
        let contractend:NSString = contractEnd.text!
        let landlord:NSString = landLord.text!
        let landlordcontact:NSString = landlordContact.text!
        let numbermate: Int? = Int(numberFlatMate.text!)
        let proprent: Int? = Int(rent.text!)
        let propdeposit: Int? = Int(deposit.text!)
        
        
        let session = NSURLSession.sharedSession()
        let newPropertyPost: NSDictionary = ["location_area": locationarea,"post_code":postcode,"street_name":streetname,"landlord_name":landlord,"landlord_contact_details":landlordcontact,"property_type":propertytype,"number_of_flatmates":numbermate!,"monthly_cost":proprent!,"deposit_amount":propdeposit!,"inclusive":false, "contract_start": contractstart, "contract_end": contractend]
        let path: String = "https://housematey.herokuapp.com/properties_only"
        let url = NSMutableURLRequest(URL: NSURL(string: path)!)
        url.HTTPMethod = "POST"
        
        // set new post as HTTPBody for request
        url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newPropertyPost, options: NSJSONWritingOptions())
            print(url.HTTPBody)
            print(newPropertyPost)
            
            
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("POST: " + postString)
                
            }
            
            let post: NSDictionary
            
            do { post = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                
                dispatch_async(dispatch_get_main_queue(),{
                    let propertyId = post["_id"] as! String
                    
                    self.userProperties.props.append(propertyId)
                    
                    self.assignNewProperty(self.userProperties.props)
                    self.performSegueWithIdentifier(segueIdentifier, sender: self)
                })
            } catch {
                print("error parsing response from post")
            }
        })
        task.resume()
        
    }
    
    func assignNewProperty(properties: NSArray) {
        
        let session = NSURLSession.sharedSession()
        let newPropertyPut: NSDictionary = ["properties": properties]
        let path: String = "https://housematey.herokuapp.com/users/\(loggedUser.id)"
        let url = NSMutableURLRequest(URL: NSURL(string: path)!)
        url.HTTPMethod = "PUT"
        
        // set new post as HTTPBody for request
        url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            url.HTTPBody = try NSJSONSerialization.dataWithJSONObject(newPropertyPut, options: NSJSONWritingOptions())
            print(newPropertyPut)
            
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        let task = session.dataTaskWithRequest(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            if let putString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("PUT: " + putString)
                
            }
            
        })
        task.resume()
    }
    
}