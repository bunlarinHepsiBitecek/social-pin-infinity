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

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var Login: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var checkBoxButton: CheckBox!
    
    /*
        variables to manage data transfer
     */
    var activityIndicator = UIActivityIndicatorView()
    /*
        User object to pass data between views
    */
    var userDatabaseObjectToPass = User()
    
    /*
        viewDidLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enableNavigationBar()
        self.setRememberMeEnabledOrDisabled()
        self.clearTextFieldsOnLoginView()
        
    }
    
    // when entrance view appears, navigation bar will be hidden immediately
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationItem.setNavigationItemTitles()
    }
    
    // to close keyboard when touches somewhere else but kwyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    // to close keyboard when press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        Login Button Clicked
     */
    @IBAction func loginButtonClick(_ sender: UIButton) {
        
        guard checkValidateRequiredField() else {
            return
        }
        
        setUserData()
        loginUserWithCredentials()
        
    }
    
    /**
     if the user forgets his/her password, we make him/her a chance to reset it
     */
    @IBAction func forgotPasswordButtonClicked(_ sender: UIButton) {
        
        guard checkValidateRequiredFieldForForgetPassword() else {
            return
        }
        
        setUserEmailData()
        createForgetPasswordAlertController(inputEmailTextString: email.text!)
        
    }
    
    @IBAction func checkBoxTapped(_ sender: Any) {
        
        registerdRememberMeUserData(inputEmail: email.text!, inputPassword: password.text!)
        
    }
    
    @IBAction func emailEditingChanged(_ sender: Any) {
        
        email.hideRightViewButton()
            
    }
    
    
    @IBAction func passwordEditingDidBegin(_ sender: Any) {
        password.addHideShowButton()
    }
    
    private func enableNavigationBar() {
        
        self.navigationController?.enableNavigationBar()
        
    }
    
}
























