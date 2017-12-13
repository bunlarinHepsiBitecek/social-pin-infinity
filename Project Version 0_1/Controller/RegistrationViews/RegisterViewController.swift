//
//  RegisterViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 19.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var user: User = User()
    
    let picker = UIDatePicker()
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var emailAddress: UITextField!
    @IBOutlet var password: HideShowPasswordTextField!
    
    @IBOutlet var userName: DesignableUITextField!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var birthdate: UITextField!
    @IBOutlet var mobilePhone: UITextField!
    
    @IBOutlet var genderManButton: UIButton!
    @IBOutlet var genderWomenButton: UIButton!
    var gender: Gender = Gender.unkown
    
    var activityIndicator = UIActivityIndicatorView()
    
    @IBAction func genderManButtonTouch(_ sender: UIButton) {
        genderManSwitchControl()
    }
    
    @IBAction func genderWomenButtonTouch(_ sender: UIButton) {
        genderWomenSwitchControl()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.enableNavigationBar()
        self.navigationItem.setNavigationItemTitles()
        
        // embeded navigation controller and scrollview slide down
        self.automaticallyAdjustsScrollViewInsets = false
        
        setupPasswordTextField()
        createDatePicker()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gotoAddImage(_ sender: Any) {
        
        // if all field validate then continue
        guard checkValidateRequiredField() else {
            return
        }
        
        setUserInfo()
        
        guard self.createUserWithCredentials() else {
            return
        }
        
        let addImageVCObject = storyboard?.instantiateViewController(withIdentifier: "AddImageViewController_storyBorad_ID") as! AddImageViewController
        
        addImageVCObject.userObject = self.user
        
        navigationController?.pushViewController(addImageVCObject, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func textFieldEditingChanged(_ textField: UITextField) {
        textField.hideRightViewButton()
    }
    
    @IBAction func birthdayEditingEnd(_ textField: UITextField) {
         textField.hideRightViewButton()
    }
    
}





