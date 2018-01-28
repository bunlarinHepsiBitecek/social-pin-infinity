//
//  MainPageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class MainPageViewController: UIViewController {
    
    var user: User = User()
    var information : Information = Information()
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.disableNavigationBar()
        
        imageView.image = user.userProfilePicture
        
        print("MainPageViewController starts")
        print("userID : \(user.userID)")
        
        directToWelcomeFirstPin()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func LogoutButtonClicked(_ sender: UIButton) {
        
        do {
            
            try Auth.auth().signOut()
            
            directCurrentPageToEntrancePage()
            
        } catch  {
            
            print("User can not log out")
            
        }
        
    }
    
    
}
