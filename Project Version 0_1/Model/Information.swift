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
        
        self._alertActionObject = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        self._alertControllerObject.addAction(self._alertActionObject)
        
        //self._alertControllerObject.runTimer()
        
    }
    
}
