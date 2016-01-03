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

        self.loggedUserName.text = "Username: \(loggedUser.username)"
        self.loggedFullName.text = "\(loggedUser.firstname) \(loggedUser.lastname)"
        self.loggedEmail.text = loggedUser.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func savePropOne(sender: UIButton) {
        
    }
    
    
    @IBAction func submitProfile(sender: UIButton) {
        
    }
    
}
