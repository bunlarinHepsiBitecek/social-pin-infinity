//
//  Information.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

class Information {
    
    private var _verificationNotifMessage : String
    private var _alertControllerObject : UIAlertController
    private var _alertActionObject : UIAlertAction
    
    
    init() {
        
        self._verificationNotifMessage = SPACE_CHARACTER
        self._alertControllerObject = UIAlertController()
        self._alertActionObject = UIAlertAction()
        
    }
    
    var verificationNotifMessage : String {
        return _verificationNotifMessage
    }
    
    var alertControllerObject : UIAlertController {
        return _alertControllerObject
    }
    
    var alertActionObject : UIAlertAction {
        return _alertActionObject
    }
    
    func setVerificationNotifMessage(inputMessage : String) {
        
        self._verificationNotifMessage = inputMessage
        
    }
    
    func setAlertController(inputTitle : String, inputMessage : String) {
        
        self._alertControllerObject = UIAlertController(title: inputTitle, message: inputMessage, preferredStyle: .alert)
        self._alertControllerObject.boko()
        self._alertActionObject = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        self._alertControllerObject.addAction(self._alertActionObject)
        
        
    }
    
    func setAlertControllerForgetPassword(inputTitle : String, inputMessage : String, inputEmailAddressText : String) {
        
        self._alertControllerObject = UIAlertController(title: inputTitle, message: inputMessage, preferredStyle: .alert)
        self._alertControllerObject.boko()
        
        self._alertControllerObject.addTextField { (emailTextField) in
            
            emailTextField.text = inputEmailAddressText
        }
        
        self._alertActionObject = UIAlertAction(title: "Şifre Sıfırlama Uyarısı", style: .destructive, handler: nil)
        self._alertControllerObject.addAction(self._alertActionObject)
    }
    
}

