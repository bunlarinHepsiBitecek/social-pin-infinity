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

        setViewCornersOnModalViewcontroller()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pinDataSaveClicked(_ sender: Any) {
        
        /*
         
            the function below, saves textdata on pin, gets screen shot of textfield to
            demonstrate for previous view, and dismiss the current modal controller view
         
         */
        getScreenShotOfTextFieldAndSetPinData()
        
    }
    
}
