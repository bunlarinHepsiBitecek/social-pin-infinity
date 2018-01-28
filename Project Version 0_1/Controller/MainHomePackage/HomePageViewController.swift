//
//  HomePageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 6.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

class HomePageViewController: UITabBarController, UITabBarControllerDelegate {

    var user : User = User()
    var sectionBasedObject = SectionBasedFriendsData()
    
    var tempDictionary = NSDictionary() as! [String : [UserFriend]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("HomePageViewController starts")
        print("userid : \(user.userID)")
        
        getUserFriendListData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print("tabBarController didSelect starts")
        
        if viewController is PinDropViewController {
            
            print("PinDropViewController is selected")
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print("tabBarController shouldSelect starts")
        
        return true
        
    }
    
}
