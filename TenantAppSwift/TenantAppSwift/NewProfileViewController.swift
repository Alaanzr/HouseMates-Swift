//
//  NewProfileViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 31/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController {
    
    let loggedUser = LoggedUser.sharedInstance

    @IBOutlet weak var loggedUserName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loggedUserName.text = loggedUser.username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
