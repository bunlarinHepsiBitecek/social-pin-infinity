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
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var emailAddress: UITextField!
    
    
    @IBOutlet var password: HideShowPasswordTextField!
    @IBOutlet var birthdate: UITextField!
    @IBOutlet var mobilePhone: UITextField!
    
    @IBOutlet var genderManButton: UIButton!
    @IBOutlet var genderWomenButton: UIButton!
    var gender: Gender = Gender.unkown
    
    @IBAction func genderButtonTapped(_ sender: UIButton) {
        genderSwitchControl(sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.enableNavigationBar()
        // embeded navigation controller and scrollview slide down
        self.automaticallyAdjustsScrollViewInsets = false
        
        setGenderButtonTag()
        setupPasswordTextField()
        createDatePicker()
        
        self.navigationItem.setNavigationItemTitles()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gotoAddImage(_ sender: Any) {
        
        setUserInfo()
        
        //performSegue(withIdentifier: "gotoAddImageAndVerificationSend", sender: self)
        
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
    
}





