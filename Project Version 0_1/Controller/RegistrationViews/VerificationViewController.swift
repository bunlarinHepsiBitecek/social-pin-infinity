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
import AudioUnit

class VerificationViewController: UIViewController {
    
    @IBOutlet var emailVerificationTextField: UITextField!
    @IBOutlet var informationMessageLabel: UILabel!
    
    var callerViewControllerID : String = SPACE_CHARACTER
    
   
    var userObjectInVerificationView = User()
    var verificationMessage = Information()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.enableNavigationBar()
        /*
         to disable back bar button item title
         */
        self.navigationItem.hideBackBarItem()
        self.manageForegroundActions()
        self.navigationItem.setNavigationItemTitles()
        
        print("VerificationViewController starts")
        print("viewDidLoad : callerViewControllerID : \(callerViewControllerID)")
        
        emailVerificationTextField.text = userObjectInVerificationView.email
        informationMessageLabel.text = verificationMessage.verificationNotifMessage
        
        userObjectInVerificationView.displayAttributeValues()
        
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
                        
                        self.directCurrentPageToMainPage()
                        
                    } else {
                        
                        print("sıcıs spor")
                        
                        /*
                        let informationObject = Information()
                        informationObject.setAlertController(inputTitle: "Uyarı", inputMessage: "Boku yedin emailine bak!")
                        
                        self.present(informationObject.alertControllerObject, animated: true, completion: nil)
                        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                        
                        let whenToCloseAlert = DispatchTime.now() + 2
                        
                        DispatchQueue.main.asyncAfter(deadline: whenToCloseAlert){
                            
                            informationObject.alertControllerObject.dismiss(animated: true, completion: nil)
                        }*/
                        
                        self.PopUpFromSCLAlertViews(inputAlertType: .Warning, inputAlertField: .ButtonActivateAccount)
                        
                    }
                    
                }
                
            }
            
        })
        
    }
    
}

