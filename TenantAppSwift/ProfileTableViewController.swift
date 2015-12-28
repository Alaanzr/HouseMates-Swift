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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleProperties(userId)

    }
    
    func loadSampleProperties(userId: String) {
        
        
        let path = "https://housematey.herokuapp.com/users_properties/\(userId)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            print(json)
            
            var count = 0
            
            for (_, object) in json {
                
                
                let userPropertyId = object["_id"].stringValue
                let userPropertyPostCode = object["post_code"].stringValue
                let userPropertyStreetName = object["street_name"].stringValue
                let userPropertyPropertyType = object["property_type"].stringValue
                let userPropertyMonthlyCost = object["monthly_cost"].stringValue
                
                let userProperty = Property(id: userPropertyId, post_code: userPropertyPostCode, street_name: userPropertyStreetName, property_type: userPropertyPropertyType, monthly_cost: userPropertyMonthlyCost)!

                
                count += 1
                
                print(userProperty)
                self.properties += [userProperty]
            
            }
            
           
            
        }
        
        task.resume()


        
//        let property1 = Property(id: "12345", post_code: "W8 5JA", street_name: "Lexham Gardens", property_type: "flat", monthly_cost: "£1000")!
//        
//        let property2 = Property(id: "123456", post_code: "W10 5JA", street_name: "Cornwall Gardens", property_type: "flat", monthly_cost: "£1500")!
//
//        properties += [property1, property2]
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
        cell.monthlycostLabel.text = property.monthly_cost

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
