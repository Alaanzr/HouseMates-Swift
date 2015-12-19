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
        print("ciao1")
        getUser()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      

        // Dispose of any resources that can be recreated.
    }
    
    func getUser() {
        
        
        let path = "https://housematey.herokuapp.com/appusers"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            print(data)
            print("ciao2")
            
            let json = JSON(data: data!)
            
            let name = json[1]["name"]
            print(name)
       }
        task.resume()
    }
  }


