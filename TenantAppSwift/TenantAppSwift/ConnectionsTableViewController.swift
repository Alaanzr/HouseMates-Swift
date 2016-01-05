//
//  ConnectionsTableViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 04/01/2016.
//  Copyright © 2016 TenantTeam. All rights reserved.
//

import UIKit
import Foundation

class ConnectionsTableViewController: UITableViewController {

    let loggedUser = LoggedUser.sharedInstance
    
    var connections = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    loadSampleUserProperties(loggedUser.id)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSampleUserProperties(userId: String) {
        
        
        
        let path = "https://housematey.herokuapp.com/user_con_list/\(userId)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            
            
            for object in json.arrayValue {
                
                
                let userConId = object["_id"].stringValue
                let userConUsername = object["username"].stringValue
                let userConFirstname = object["firstName"].stringValue
                let userConLastname = object["lastName"].stringValue
                let userConTargetArea = object["currentArea"].stringValue
                let userConTargetRent = object["currentRentBand"].intValue
                
                let userConnection = User(id: userConId, username: userConUsername, firstname: userConFirstname, lastname: userConLastname,targetArea: userConTargetArea, targetRent: userConTargetRent)!
            
                
                self.connections.append(userConnection)
                print(self.connections[0].targetArea)
                
            }
            
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
            })
        }
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return connections.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let NewcellIdentifier = "ConnectionsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(NewcellIdentifier, forIndexPath: indexPath) as! ConnectionsTableViewCell

        let connection = connections[indexPath.row]
        
        cell.usernameLabel.text = connection.username
        cell.targetareaLabel.text = connection.targetArea
        cell.targetrentLabel.text = String(connection.targetRent)

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
