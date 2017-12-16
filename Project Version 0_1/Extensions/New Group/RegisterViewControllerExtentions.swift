//
//  RegisterViewControllerExtentions.swift
//  Project Version 0_1
//
//  Created by Remzi on 26/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import CoreTelephony

// MARK: HideShowPasswordTextFieldDelegate
// Implementing this delegate is entirely optional.
// It's useful when you want to show the user that their password is valid.
extension RegisterViewController: HideShowPasswordTextFieldDelegate {
    func isValidPassword(password: String) -> Bool {
        let responsePasswordFieldValidation = Validation.shared.validate(values: (type: ValidationFields.passwordField, inputValue: password))
        
        switch responsePasswordFieldValidation {
        case .success:
            print("password validation is ok")
            return true
        default:
            print("password validation is failed")
            return false
        }
    }
}

// Password
extension RegisterViewController {
     func setupPasswordTextField() {
        //password.passwordDelegate = self
    }
}

// Gender
extension RegisterViewController {
    func genderButtonInit() {
        genderManButton.alpha = 0.5
        genderWomenButton.alpha = 0.5
    }
    func genderManSwitchControl() {
        print("Man is selected")
        /*
        genderManButton.isHighlighted = true
        genderWomenButton.isHighlighted = false
        */
        genderManButton.alpha = 1
        genderWomenButton.alpha = 0.5
        gender = Gender.male
    }
    
    func genderWomenSwitchControl() {
        print("Woman is selected")
        /*
        genderWomenButton.isHighlighted = true
        genderManButton.isHighlighted = false
        */
        genderManButton.alpha = 0.5
        genderWomenButton.alpha = 1
        gender = Gender.female
    }
}

// Birthdate
extension RegisterViewController {
    func createDatePicker() {
        let date18YearsAgo: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        birthdate.inputAccessoryView = toolbar
        birthdate.inputView = picker
        
        picker.datePickerMode = UIDatePickerMode.date
        picker.setDate(date18YearsAgo, animated: false)
        
    }
    
    func dateFormatText(datePicker: UIDatePicker) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.RegisterPage.DATE_PICKER_FORMAT
        
        return formatter.string(from: datePicker.date)
    }
    
    @objc func donePressed() {
        birthdate.text = dateFormatText(datePicker: picker)
        self.view.endEditing(true)
    }
    
    
}

// Phone
extension RegisterViewController {
    func getCountryCodeForPhone()  -> String {
        // Setup the Network Info and create a CTCarrier object
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        
        // Get carrier name
        if let countryCode = carrier?.isoCountryCode {
            return countryCode
        }
        
        return ""
    }
}

extension RegisterViewController {
    func checkValidateRequiredField() -> Bool {
        let isEmailValid = checkValidateEmail()
        let isPasswordValid = checkValidatePassword()
        let isUserNameValid = checkValidateUsername()
        let isFirstNameValid = checkValidateFirstName()
        let isLastNameValid = checkValidateLastName()
        let isBirthdateValid = checkValidateBirthdate()
        
        guard isEmailValid, isPasswordValid, isUserNameValid,  isFirstNameValid, isLastNameValid, isBirthdateValid else {
            return false
        }
        return true
    }
}

// Email validation
extension RegisterViewController {
    func checkValidateEmail() -> Bool {
        guard let _ = emailAddress.text,  emailAddress.text != SPACE_CHARACTER else {
            emailAddress.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            return false
        }
        
        let responseEmailFieldValidation = Validation.shared.validate(values: (type: ValidationFields.emailField, inputValue: emailAddress.text!))
        
        switch responseEmailFieldValidation {
        case .success:
            return true
        default:
            //showError()
            emailAddress.addRightViewButton(popOverStyle: FTPopOverStyle.invalidEmail)
            return false
        }
    }
    
    /*
    func showError() {
        let appearance = SCLAlertView.SCLAppearance(
            // action here
            // showCloseButton: false
        )
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.showError("", subTitle: "Email address is invalid", closeButtonTitle: "Dismiss", timeout:SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 2.0, timeoutAction:timeoutAction))
    }
    */
    
}

// Password validation
extension RegisterViewController {
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
            password.addRightViewButton(popOverStyle: FTPopOverStyle.invalidPassword)
            //password.showPopOver(popOverStyle: FTPopOverStyle.invalidPassword)
            return false
        }
    }
}

// Username validation
extension RegisterViewController {
    func checkValidateUsername() -> Bool {
        guard let _ = userName.text,  userName.text != SPACE_CHARACTER else {
            userName.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            return false
        }
        
       return true
    }
}

// Firstname validation
extension RegisterViewController {
    func checkValidateFirstName() -> Bool {
        guard let _ = firstName.text,  firstName.text != SPACE_CHARACTER else {
            firstName.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            return false
        }
        
        return true
    }
}

// Lastname validation
extension RegisterViewController {
    func checkValidateLastName() -> Bool {
        guard let _ = lastName.text,  lastName.text != SPACE_CHARACTER else {
            lastName.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            return false
        }
        
        return true
        
    }
}

// Birtday validation
extension RegisterViewController {
    func checkValidateBirthdate() -> Bool {
        guard let _ = birthdate.text,  birthdate.text != SPACE_CHARACTER else {
            birthdate.addRightViewButton(popOverStyle: FTPopOverStyle.required)
            return false
        }
        
        return true
        
    }
}

extension RegisterViewController {
    func  setUserInfo() {
        
        user.setUserGender(inputUserGender: gender.rawValue)
        user.setUserName(inputName: userName.text!)
        user.setUserNameSurname(inputNameSurname: firstName.text! + " " + lastName.text!)
        user.setUserEmail(inputEmail: emailAddress.text!)
        user.setUserPassword(inputPassword: password.text!)
        user.setUserBirthday(inputUserBirthday: birthdate.text!)
        user.setUserMobilePhone(inputUserMobilePhone: mobilePhone.text!)
        
        user.printUserInfo()
    }
}
