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
    
    /*
        check validation is ok for text fields on login view
     */
    func checkValidateRequiredField() -> Bool {
        let isEmailValid = checkValidateEmail()
        let isPasswordValid = checkValidatePassword()
        
        guard isEmailValid, isPasswordValid else {
            return false
        }
        return true
        
    }
    
    /*
     check validation is ok for forget password alert view controller
     */
    func checkValidateRequiredFieldForForgetPassword() -> Bool {
        
        let isEmailValid = checkValidateEmail()
        
        guard isEmailValid else {
            return false
        }
        return true
        
    }
    
    /*
        email validation control block
     */
    func checkValidateEmail() -> Bool {
        guard let _ = email.text,  email.text != SPACE_CHARACTER else {
            email.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            email.showPopOver(popOverStyle: .required)
            return false
        }
        
        let responseEmailFieldValidation = Validation.shared.validate(values: (type: ValidationFields.emailField, inputValue: email.text!))
        
        switch responseEmailFieldValidation {
        case .success:
            return true
        default:
            //showError()
            email.showPopOver(popOverStyle: .invalidEmail)
            email.addRightViewButton(popOverStyle: FTPopOverStyle.invalidEmail)
            return false
        }
    }
    
    
    /*
        password validation control block
     */
    func checkValidatePassword() -> Bool {
        guard let _ = password.text,  password.text != SPACE_CHARACTER  else {
            password.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            //password.showPopOver(popOverStyle: FTPopOverStyle.required)
            return false
        }
        
        let responsePasswordFieldValidation = Validation.shared.validate(values: (type: ValidationFields.passwordField, inputValue: password.text!))
        
        switch responsePasswordFieldValidation {
        case .success:
            return true
        default:
            //password.addRightViewButton(popOverStyle: FTPopOverStyle.invalidPassword)
            password.showPopOver(popOverStyle: FTPopOverStyle.invalidPassword)
            return false
        }
    }
    
}

