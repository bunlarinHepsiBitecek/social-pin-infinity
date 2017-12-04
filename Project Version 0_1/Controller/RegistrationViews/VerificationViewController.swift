//
//  VerificationViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 21.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class VerificationViewController: UIViewController {

    @IBOutlet var emailVerificationTextField: UITextField!
    
    var callerViewControllerID : String = SPACE_CHARACTER
    
    var userObjectInVerificationView = User()
    var verificationMessage = Information()
    
    @IBOutlet var verificationInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.enableNavigationBar()
        self.manageForegroundActions()
        navigationItem.setNavigationItemTitle()
        
        print("VerificationViewController starts")
        print("viewDidLoad : callerViewControllerID : \(callerViewControllerID)")
        
        emailVerificationTextField.text = userObjectInVerificationView.email
        
        userObjectInVerificationView.displayAttributeValues()
        
        verificationInfoLabel.text = verificationMessage.verificationNotifMessage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSendVerificationEmailAgain(_ sender:
        UIButton) {
        
        sendVerificationMail()
        
    }
    
    @IBAction func activateAccount(_ sender: UIButton) {
        
        Auth.auth().currentUser?.reload(completion: { (error) in
            
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    
                    print("LoginButtonClick : \(errorMessage)")
                    print("LoginButtonClick : \(errorMessage.userInfo)")
                    print("LoginButtonClick : \(errorMessage.localizedDescription)")
                    
                }
                
            } else {
                
                if let user = Auth.auth().currentUser {
                    
                    print("-----------------> user email verification : \(user.isEmailVerified)")
                    
                    if user.isEmailVerified {
                        
                        print("takasi bom bom")
                        
                    } else {
                        
                        print("sıcıs spor")
                        
                    }
                    
                }
                
            }
            
        })
        
    }
    
}
