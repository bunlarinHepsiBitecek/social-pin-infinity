
//
//  AddImageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var continueVerificationPageButton: UIButton!
    
    var userObject = User.init()
    
    var gotoBack : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("AddImageViewController starts")
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getProfilePhoto)))
        imageView.isUserInteractionEnabled = true
        
        self.imageView.setRoundedDesignToProfilePictureImageViews()
        userObject.displayAttributeValues()
        
        self.navigationItem.setNavigationItemTitles()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deneme(_ sender: UIButton) {
        
        print("deneme takasi")
        print(userObject.email)
        print(userObject.userID)
        self.decideHowProfilePictureLoads()
        
    }
    
    @IBAction func gotoVerificationPage(_ sender: UIButton) {
        
        print("gotoVerificationPage starts")
        let verificationViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "VerificationViewController_storyBoardID") as! VerificationViewController
        
        createUserAndLoadDataToStorage()
        
        sendVerificationMail(inputUserObject: userObject)
        
    }
}

