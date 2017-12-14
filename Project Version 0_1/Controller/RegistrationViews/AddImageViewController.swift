
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getPictureChoiseByTappingProfileImage()
        self.imageView.setRoundedDesignToProfilePictureImageViews()
        self.navigationItem.setNavigationItemTitles()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseProfilePictureButtonTapped(_ sender: UIButton) {
        
        self.decideHowProfilePictureLoads()
        
    }
    
    @IBAction func gotoVerificationPage(_ sender: UIButton) {
        
        let verificationViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "VerificationViewController_storyBoardID") as! VerificationViewController
        
        createUserAndLoadDataToStorage()
        
        sendVerificationMail()
        
    }
    
    func getPictureChoiseByTappingProfileImage() {
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDecideHowProfilePictureLoads)))
        imageView.isUserInteractionEnabled = true
        
    }
    
}

