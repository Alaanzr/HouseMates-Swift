//
//  PropOneViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 03/01/2016.
//  Copyright © 2016 TenantTeam. All rights reserved.
//

import UIKit

class PropOneViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
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
