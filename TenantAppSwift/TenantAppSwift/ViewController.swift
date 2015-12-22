//
//  ViewController.swift
//  TenantAppSwift
//
//  Created by Alix on 17/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
        override func viewDidLoad() {
            super.viewDidLoad()
            createService().createUser()
            createService().createProperty()

            editService().editUser()
            editService().editProperty()
            getService().getUser()
            deleteService().deleteUser()
        

        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    }



