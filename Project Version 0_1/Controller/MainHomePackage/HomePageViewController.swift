//
//  HomePageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 6.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class HomePageViewController: UITabBarController {

    var user : User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("HomePageViewController starts")
        print("userid : \(user.userID)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
