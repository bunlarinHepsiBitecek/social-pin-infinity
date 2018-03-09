//
//  GroupInfoChangedViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/3/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class GroupInfoChangedViewController: UIViewController {

    @IBOutlet var groupNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        
        print("self.groupNameTextField.frame.height : \(self.groupNameTextField.frame.height)")
        print("self.groupNameTextField.frame.width : \(self.groupNameTextField.frame.width)")
        
        print("self.groupNameTextField.frame.size.width : \(self.groupNameTextField.frame.size.width)")
        print("self.groupNameTextField.frame.size.height : \(self.groupNameTextField.frame.size.height)")
        
        border.frame = CGRect(x: -1, y: 0, width:  groupNameTextField.frame.size.width + 2, height: groupNameTextField.frame.size.height)
        
        border.borderWidth = width
        
        groupNameTextField.layer.addSublayer(border)
        
        groupNameTextField.layer.masksToBounds = true
        
        groupNameTextField.addLeftViewToTextField(10)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
