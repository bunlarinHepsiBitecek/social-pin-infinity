
//
//  TempoaryAddImageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class TempoaryAddImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var continueVerificationPageButton: UIButton!
    
    var userObject = User.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getProfilePhoto)))
        imageView.isUserInteractionEnabled = true
        
        self.imageView.setRoundedDesignToProfilePictureImageViews()
        //self.imageView.setImageViewLike3dEffect()
        userObject.displayAttributeValues()
        
        navigationItem.setNavigationItemTitle()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("ttttt")
        
        self.imageView.setRoundedDesignToProfilePictureImageViews()
        //self.imageView.setImageViewLike3dEffect()
        
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
        
        let verificationViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "VerificationViewController_storyBoardID") as! VerificationViewController
        
        createUserAndLoadDataToStorage()

        if sendVerificationMail() {
            
            verificationViewControllerObject.verificationInfoLabel.text = USER_EMAIL_VERIFICATION_NOTIF_SUCCESS
            
        } else {
            
            verificationViewControllerObject.verificationInfoLabel.text = USER_EMAIL_VERIFICATION_NOTIF_FAILED
            
        }
        
        verificationViewControllerObject.userObjectInVerificationView = userObject
        
        navigationController?.pushViewController(verificationViewControllerObject, animated: true)
        
        
    }
}
