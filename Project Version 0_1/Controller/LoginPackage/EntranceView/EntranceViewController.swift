//
//  EntranceViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 19.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import SwiftKeychainWrapper

class EntranceViewController: UIViewController,  FBSDKLoginButtonDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    var user: User = User()
    
    @IBOutlet var facebookLoginButton: FBSDKLoginButton!
    
    @IBOutlet var twitterLoginButton: TWTRLogInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.disableNavigationBar()
        
        // embeded navigation controller and scrollview slide down
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.setNavigationItemTitles()
        
        // embeded navigation controller and scrollview space issue solved
        self.extendedLayoutIncludesOpaqueBars = true
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        twitterLogin()
        
        setFacebookAccessTokenPermissions()
        
    }
    
    func setFacebookAccessTokenPermissions() {
        
        /*
         user friends listesini almak için facebook butonuna permission verelim
         */
        
        let permissions = [FacebookProperties.FacebookAccessTokenPermissions.public_profile
            ,FacebookProperties.FacebookAccessTokenPermissions.email
            ,FacebookProperties.FacebookAccessTokenPermissions.user_friends]
        
        facebookLoginButton.readPermissions = permissions
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //self.navigationController?.disableNavigationBar()
        
        // facebook delegation
        facebookLoginButton.delegate = self
    }
    
    // when entrance view appears, navigation bar will be hidden immediately
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.setNavigationItemTitles()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        navigationItem.title = SPACE_CHARACTER
        
        performSegue(withIdentifier: "gotoLoginPage", sender: self)
        
    }
    @IBAction func registerButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "gotoRegisterPage", sender: self)
        
    }
    
}

