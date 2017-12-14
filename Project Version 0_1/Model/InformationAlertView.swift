//
//  InformationAlertView.swift
//  Project Version 0_1
//
//  Created by Remzi on 13/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

class InformationAlertView {
    
    func showError(subTitle: String) {
        let appearance = SCLAlertView.SCLAppearance(
            // action here
            // showCloseButton: false
        )
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.showError(CONSTANT_STRING_ERROR, subTitle: subTitle, closeButtonTitle: CONSTANT_STRING_OK, timeout:SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 2.0, timeoutAction:timeoutAction))
    }

 }
