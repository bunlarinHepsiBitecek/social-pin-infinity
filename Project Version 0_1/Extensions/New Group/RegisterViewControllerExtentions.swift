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
        password.passwordDelegate = self
    }
}

// Gender
extension RegisterViewController {
    func setGenderButtonTag() {
        genderManButton.tag = GenderButtonTag.male.rawValue
        genderWomenButton.tag = GenderButtonTag.female.rawValue
    }
    
    func genderSwitchControl(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        switch sender.tag {
        case GenderButtonTag.male.rawValue:
            if(genderManButton.isSelected) {
                genderWomenButton.isEnabled = false
                gender = Gender.male
            }  else {
                genderWomenButton.isEnabled = true
                gender = Gender.unkown
            }
            break;
        case GenderButtonTag.female.rawValue:
            if(genderWomenButton.isSelected) {
                genderManButton.isEnabled = false
                gender = Gender.female
            } else {
                genderManButton.isEnabled = true
                gender = Gender.unkown
            }
            break;
        default: ()
        break;
        }
    }
}

// Birthdate
extension RegisterViewController {
    func createDatePicker() {
        //
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        birthdate.inputAccessoryView = toolbar
        birthdate.inputView = picker
        
        picker.datePickerMode = UIDatePickerMode.date
        
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
    func validationCheck() {
        let responsePasswordFieldValidation = Validation.shared.validate(values: (type: ValidationFields.passwordField, inputValue: password.text!))
        
        switch responsePasswordFieldValidation {
        case .success:
            print("password validation is ok")
        default:
            print("password validation is failed")
        }
    }
}

extension RegisterViewController {
    func  setUserInfo() {
        
        user.setUserGender(inputUserGender: gender.rawValue)
        user.setUserName(inputName: firstName.text!)
        user.setUserNameSurname(inputNameSurname: firstName.text! + " " + lastName.text!)
        user.setUserEmail(inputEmail: emailAddress.text!)
        user.setUserPassword(inputPassword: password.text!)
        user.setUserBirthday(inputUserBirthday: birthdate.text!)
        user.setUserMobilePhone(inputUserMobilePhone: mobilePhone.text!)
        
        user.printUserInfo()
    }
}
