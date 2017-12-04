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
        
        //self._alertControllerObject.view.backgroundColor = UIColor(red: 255, green: 10, blue: 0, alpha: 0.5)
        //self._alertControllerObject.view.tintColor = UIColor.blue
        //self._alertControllerObject.view.backgroundColor = UIColor(red: 255, green: 224, blue: 71, alpha: 1)
        //self._alertControllerObject.view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        //self._alertControllerObject.setGradientBackground()
        self._alertControllerObject.boko()
        
        print(self._alertControllerObject.view.backgroundColor?.cgColor)
        
        self._alertControllerObject.view.layer.cornerRadius = 30
        
        self._alertActionObject = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        
        self._alertControllerObject.addAction(self._alertActionObject)
        
        //self._alertControllerObject.runTimer()
        
    }
    
}
