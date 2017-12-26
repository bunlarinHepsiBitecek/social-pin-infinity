//
//  PinDataChoiseView.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 18.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

protocol PinDataChoiseViewDelegate: class {
    
    //func detailsRequestedForPerson(person: User)
    //func addImageRequestForPerson(person: User)
}

class PinDataChoiseView: UIView {

    @IBOutlet var baba: UIButton!
    @IBOutlet var cameraButton: UIButtonCustomDesign!
    @IBOutlet var cameraLongButton: UIButtonCustomDesign!
    @IBOutlet var videoButton: UIButtonCustomDesign!
    @IBOutlet var videoLongButton: UIButtonCustomDesign!
    @IBOutlet var textButton: UIButtonCustomDesign!
    @IBOutlet var textLongButton: UIButtonCustomDesign!
    
    weak var delegateForPinDataChoiseView: PinDataChoiseViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("Erkut: awakeFromNib in PinDataChoiseView view")
        
        cameraButton.isUserInteractionEnabled = true
        
    }
    
    @IBAction func cameraClicked(_ sender: Any) {
    }
    
    @IBAction func cameraLongClicked(_ sender: Any) {
    }
    @IBAction func videoClicked(_ sender: Any) {
    }
    @IBAction func videoLongClicked(_ sender: Any) {
    }
    @IBAction func textClicked(_ sender: Any) {
    }
    @IBAction func textLongClicked(_ sender: Any) {
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        print("hittest starts")
        
        // details button
        if let result = cameraButton.hitTest(convert(point, to: cameraButton), with: event) {
            return result
        }
        
        if let result = cameraLongButton.hitTest(convert(point, to: cameraLongButton), with: event) {
            return result
        }
        
        if let result = videoButton.hitTest(convert(point, to: videoButton), with: event) {
            return result
        }
        
        if let result = videoLongButton.hitTest(convert(point, to: videoLongButton), with: event) {
            return result
        }
        
        if let result = textButton.hitTest(convert(point, to: textButton), with: event) {
            return result
        }
        
        if let result = textLongButton.hitTest(convert(point, to: textLongButton), with: event) {
            return result
        }
        
        // fallback to our background content view
        return baba.hitTest(convert(point, to: baba), with: event)
        
    }
    
}
