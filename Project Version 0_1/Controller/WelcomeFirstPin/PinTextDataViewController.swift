//
//  PinTextDataViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 22.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class PinTextDataViewController: UIViewController {

    @IBOutlet var pinTextView: UIView!
    @IBOutlet var textField: UITextView!
    @IBOutlet var pinTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pinTextView.changeCornerRadiues()
        textField.changeCornerRadiues()
        pinTextButton.changeCornerRadiues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pinDataSaveClicked(_ sender: Any) {
        
        self.dismiss(animated: true) {
        
            print("hadi güle güle :)")
            
        }
        
        
    }
    
}
