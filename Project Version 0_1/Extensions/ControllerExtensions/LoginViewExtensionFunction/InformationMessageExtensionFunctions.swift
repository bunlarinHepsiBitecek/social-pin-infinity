//
//  InformationMessageExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 4.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import AudioUnit

extension LoginViewController {
    
    func createWarningMessage(inputTitle : String, inputMessage : String) {
        
        let informationObject = Information()
        informationObject.setAlertController(inputTitle: inputTitle, inputMessage: inputMessage)
        
        self.present(informationObject.alertControllerObject, animated: true, completion: nil)
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let whenToCloseAlert = DispatchTime.now() + 2
        
        DispatchQueue.main.asyncAfter(deadline: whenToCloseAlert){
           
            informationObject.alertControllerObject.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
