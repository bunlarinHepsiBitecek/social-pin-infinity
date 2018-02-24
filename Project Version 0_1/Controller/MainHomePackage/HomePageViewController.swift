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
    var sectionBasedFriendsDataObject = SectionBasedFriendsData()
    
    var tempDictionary = NSDictionary() as! [String : [UserFriend]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("HomePageViewController starts")
        print("userid : \(user.userID)")
        
        getUserFriendListData()
        readUserInfo()
        
        startGettingGroupDataProcess()
        
        //setUserProfilePictureToObject()
        
        print("user yarro : \(user.userProfilePictureUrl)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
