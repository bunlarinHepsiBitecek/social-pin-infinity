//
//  PinTextDataViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 22.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class PinTextDataViewController: UIViewController {

    @IBOutlet var pinTextView: UIView!
    @IBOutlet var textField: UITextView!
    @IBOutlet var checkButton: UIButtonCustomDesign!
    @IBOutlet var garbageButton: UIButtonCustomDesign!
    @IBOutlet var pinNoteLabel: UILabel!
    
    var pinDataObject = PinData()
    var tempMapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.text = pinDataObject.textOnPin
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
        print("******* : \(textField.text)")
        getScreenShotOfTextFieldAndSetPinData()
        
    }
    
    @IBAction func garbageButtonClicked(_ sender: Any) {
        
        eraseTextFieldFromPinData()
        
    }
}
