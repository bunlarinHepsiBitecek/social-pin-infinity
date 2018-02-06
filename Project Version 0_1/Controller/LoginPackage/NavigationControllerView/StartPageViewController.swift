//
//  StartPageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class StartPageViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("ilk ekran")
        print("Entrance view starts")
        print("KeyChainData : \(KeychainWrapper.standard.string(forKey: USER_ID))")
        
        navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Pacifico", size: 25)!, NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationItem.setNavigationItemTitles()
        
        print("data size : \(cachedFriendProfileImages.object(forKey: "https://firebasestorage.googleapis.com/v0/b/social-media-infinity.appspot.com/o/Users%2FProfileImages%2F3c3f9f33_d58f_48ef_b_VemLR.jpg?alt=media&token=fda788b6-347d-4a8b-9940-8c1317f1b665" as NSString))")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
