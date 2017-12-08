//
//  LoginViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 19.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper
import CheckBox

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var Login: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var checkBoxButton: CheckBox!
    
    var activityIndicator = UIActivityIndicatorView()
    
    var emailStringValue : String = SPACE_CHARACTER
    
    // User object to pass data between views
    var userDatabaseObjectToPass = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("LoginView viewDidLoad activated")

        self.navigationController?.enableNavigationBar()
        
        /*
        email.text = "erkutbas007@gmail.com"
        password.text = "123456"*/
        
        self.setRememberMeEnabledOrDisabled()
        self.navigationItem.setNavigationItemTitles()
        self.clearTextFieldsOnLoginView()
    }
    
    
    // to close keyboard when touches somewhere else but kwyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("TouchesBegan is activated")
        
        self.view.endEditing(true)
    }
    
    // to close keyboard when press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn is activated")
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonClick(_ sender: UIButton) {
        
        // set user email and password to send verification page
        
        if checkAllFieldsValid() {
            
            setUserData()
            loginUserWithCredentials()
            
        } else {
            
            createWarningMessage(inputTitle: CONSTANT_STRING_WARNING, inputMessage: CONSTANT_STRING_WARNING_INVALID_FIELDS)
            
        }
        
    }
    
    /**
        if the user forgets his/her password, we make him/her a chance to reset it
     */
    @IBAction func forgotPasswordButtonClicked(_ sender: UIButton) {
        
        setUserEmailData()
        createForgetPasswordAlertController(inputEmailTextString: email.text!)
        
        //performSegue(withIdentifier: "gotoForgotPasswordView", sender: self)
        
    }
    
    /*
        SwiftKeyChainWrapper functions
     */
    @IBAction func deneme(_ sender: UIButton) {
        
        let temp = storyboard?.instantiateViewController(withIdentifier: "AddImageViewController_storyBorad_ID") as! AddImageViewController
        
        temp.userObject = userDatabaseObjectToPass
        
        navigationController?.pushViewController(temp, animated: true)
        
    }
    
    @IBAction func checkBoxTapped(_ sender: Any) {
        
        registerdRememberMeUserData(inputEmail: email.text!, inputPassword: password.text!)
        
    }
    
    /**
     email & password field must be check before login,
     if email or password is not validated login button must be disabled
     ..........
     */
    @IBAction func emailTextFieldValidationCheck(_ sender: Any) {
        
        if !evaluateEmailField() {
            
            createWarningMessage(inputTitle: CONSTANT_STRING_WARNING, inputMessage: CONSTANT_WARNING_INVALID_EMAIL_FORMAT)
            
            email.clearTextFiedl()
        }
        
    }
    
    @IBAction func passwordTextFieldValidationCheck(_ sender: Any) {
        
        if !evaluatePasswordField() {
            
            createWarningMessage(inputTitle: CONSTANT_STRING_WARNING, inputMessage: CONSTANT_WARNING_INVALID_PASSWORD_FORMAT)
            
            password.clearTextFiedl()
            
        }
        
    }
}
























