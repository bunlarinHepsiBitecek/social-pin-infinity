//
//  PersonPinDetailMapView.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

protocol PersonPinDetailMapViewDelegate: class {
    func addImageRequestForPerson(person: User)
    func addVideoRequestForPerson(person: User)
    func addTextRequestForPerson(person: User)
    func okRequestForPerson(person: User)
    func cancelRequestForPerson(person: User)
}

class PersonPinDetailMapView: UIView {
    // outlets
    @IBOutlet var backgroundContentButton: UIButton!
    
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var addVideoButton: UIButton!
    @IBOutlet var addTextButton: UIButton!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancelButon: UIButton!
    
    
    // data
    var person: User!
    weak var delegate: PersonPinDetailMapViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("Remzi: awakeFromNib")
        // appearance
        backgroundContentButton.applyArrowDialogAppearanceWithOrientation(arrowOrientation: .down)
    }
    
    @IBAction func addImage(_ sender: Any) {
        print("Remzi: addImage button click")
        delegate?.addImageRequestForPerson(person: person)
    }
    
    
    @IBAction func addVideo(_ sender: Any) {
        print("Remzi: addVideo button click")
        delegate?.addVideoRequestForPerson(person: person)
    }
    
    @IBAction func addText(_ sender: Any) {
        print("Remzi: addText start")
        delegate?.addTextRequestForPerson(person: person)
    }
    
    
    @IBAction func okButton(_ sender: Any) {
        print("Remzi: ok ")
        delegate?.okRequestForPerson(person: person)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        print("Remzi: cancel ")
        delegate?.cancelRequestForPerson(person: person)
    }
    
    
    
    func configureWithPerson(person: User) {
        print("Remzi: configureWithPerson")
        self.person = person
    }
    
    
    // MARK: - Hit test. We need to override this to detect hits in our custom callout.
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Check if it hit our annotation detail view components.
        
        print("Remzi: Hit Test tetiklendi")
        
        // add image button
        if let result = addImageButton.hitTest(convert(point, to: addImageButton), with: event) {
            return result
        }
        
        // add video button
        if let result = addVideoButton.hitTest(convert(point, to: addVideoButton), with: event) {
            return result
        }
        
        // add text button
        if let result = addTextButton.hitTest(convert(point, to: addTextButton), with: event) {
            return result
        }
        
        // ok button
        if let result = okButton.hitTest(convert(point, to: okButton), with: event) {
            return result
        }
        
        // ok button
        if let result = cancelButon.hitTest(convert(point, to: cancelButon), with: event) {
            return result
        }
        
        // fallback to our background content view
        return backgroundContentButton.hitTest(convert(point, to: backgroundContentButton), with: event)
    }
}
