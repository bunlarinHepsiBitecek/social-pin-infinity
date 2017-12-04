//
//  AddImageVerificationViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 21.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class AddImageVerificationViewController: UIViewController {
    
    var user: User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.enableNavigationBar()
        
        print("****************************")
        user.printUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func testGotoEmailVerificationPage(_ sender: Any) {
        
        performSegue(withIdentifier: "gotoEmailVerificationInfo", sender: self)
        
    }
    

}
