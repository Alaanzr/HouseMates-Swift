//
//  ProfileTableViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 28/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit
import Foundation

class ProfileTableViewController: UITableViewController {
    
    let userId = "56772693638b191100fcd2df"
    var properties = [Property]()
    var lbl_header = UILabel()
    
    // MARK: User information
    
    @IBOutlet weak var firstnameLabel: UILabel!
    
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var userPicture: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleUserProperties(userId)
        loadSampleUserDetails(userId)
    }
    
    func loadSampleUserDetails(userId: String) {
        
        
        
        let path = "https://housematey.herokuapp.com/users/\(userId)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
                
                
                let userId = json["_id"].stringValue
                let userUserName = json["username"].stringValue
                let userFirstName = json["firstName"].stringValue
                let userLastName = json["lastName"].stringValue
                
            let userDetails = User(id: userId, username: userUserName, firstname: userFirstName, lastname: userLastName)!
            
            
            dispatch_async(dispatch_get_main_queue(),{
                
                self.firstnameLabel.text = userDetails.firstname
                self.lastnameLabel.text = userDetails.lastname
                self.usernameLabel.text = userDetails.username
                self.userPicture.image = userDetails.photo
            })
        }
        
        task.resume()
        
        
    }
    
    
    func loadSampleUserProperties(userId: String) {
        
        
        
        let path = "https://housematey.herokuapp.com/users_properties/\(userId)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            
            
            for object in json.arrayValue {
                
                
                let userPropertyId = object["_id"].stringValue
                let userPropertyPostCode = object["post_code"].stringValue
                let userPropertyStreetName = object["street_name"].stringValue
                let userPropertyPropertyType = object["property_type"].stringValue
                let userPropertyMonthlyCost = object["monthly_cost"].intValue
                
                let userProperty = Property(id: userPropertyId, post_code: userPropertyPostCode, street_name: userPropertyStreetName, property_type: userPropertyPropertyType, monthly_cost: userPropertyMonthlyCost)!
                
                self.properties.append(userProperty)
                
                
            }
            
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
            })
        }
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return properties.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifier = "ProfileTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProfileTableViewCell
        
        let property = properties[indexPath.row]

        cell.propertytypeLabel.text = property.property_type
        cell.postcodeLabel.text = property.post_code
        cell.streetnameLabel.text = property.street_name
        cell.monthlycostLabel.text = String(property.monthly_cost)

        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection  section: Int) -> UIView?
    {
        self.lbl_header.frame = CGRectMake(20, 20, self.view.frame.size.width, 150)
        self.lbl_header.text = "My rental history"
        self.lbl_header.backgroundColor = UIColor.lightGrayColor()
        self.lbl_header.textColor = UIColor.whiteColor()
        self.lbl_header.textAlignment = NSTextAlignment.Center
        return self.lbl_header
        
    }
    
    
}
