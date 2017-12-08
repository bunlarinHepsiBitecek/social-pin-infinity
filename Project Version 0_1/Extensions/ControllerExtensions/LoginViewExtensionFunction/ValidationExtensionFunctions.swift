//
//  ValidationExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func evaluateEmailField() -> Bool {
        
        let responseEmailFieldValidation = Validation.shared.validate(values: (type: ValidationFields.emailField, inputValue: email.text!))
        
        switch responseEmailFieldValidation {
        case .success:
            print("email validation is ok")
            return true
        default:
            print("email validation is failed")
            return false
        }
    }
    
    func evaluatePasswordField() -> Bool {
        
        let responsePasswordFieldValidation = Validation.shared.validate(values: (type: ValidationFields.passwordField, inputValue: password.text!))
        
        switch responsePasswordFieldValidation {
        case .success:
            print("password validation is ok")
            return true
        default:
            print("password validation is failed")
            return false
        }
    }
    
    func checkAllFieldsValid() -> Bool {
        
        if self.email.checkTextFieldHasStringValue() && self.password.checkTextFieldHasStringValue() {
            
            return true
            
        } else {
            
            return false
            
        }
    }
    
}
