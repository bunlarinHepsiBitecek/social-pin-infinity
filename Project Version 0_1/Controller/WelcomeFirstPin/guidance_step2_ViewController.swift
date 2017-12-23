//
//  guidance_step2_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class guidance_step2_ViewController: UIViewController {

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("guidance_step2_ViewController starts")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func gotoMapView(_ sender: Any) {
        
        print("bastım")
        
        performSegue(withIdentifier: "gotoMapView", sender: self)
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("prepare : user : \(user.userID)")
        
        if segue.identifier == "gotoMapView" {
            if let welcome = segue.destination as? WelcomeFirstPinViewController {
                welcome.controlFlag = true
                welcome.user = user
            }
        }
    }

}
