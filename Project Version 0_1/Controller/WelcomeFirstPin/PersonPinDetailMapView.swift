//
//  PersonPinDetailMapView.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

protocol PersonPinDetailMapViewDelegate: class {
    func detailsRequestedForPerson(person: User)
    func addImageRequestForPerson(person: User)
}

class PersonPinDetailMapView: UIView {
    // outlets
    @IBOutlet var backgroundContentButton: UIButton!
    @IBOutlet var personProfileImageView: UIImageView!
    @IBOutlet var personName: UILabel!
    @IBOutlet var personPinImageView: UIImageView!
    
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var seeDetailsButton: UIButton!
    
    // data
    var person: User!
    weak var delegate: PersonPinDetailMapViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("Remzi: awakeFromNib")
        // appearance
        backgroundContentButton.applyArrowDialogAppearanceWithOrientation(arrowOrientation: .down)
    }
    
    @IBAction func seeDetails(_ sender: Any) {
        print("Remzi: seeDetails button click")
        delegate?.detailsRequestedForPerson(person: person)
    }
    
    @IBAction func addImage(_ sender: Any) {
        print("Remzi: addImage button click")
        delegate?.addImageRequestForPerson(person: person)
    }
    
    
    
    func configureWithPerson(person: User) {
        self.person = person
        
        personProfileImageView.image = person.userProfilePicture
        personName.text = person.username + " " + person.userNameSurname
    }
    
    
    // MARK: - Hit test. We need to override this to detect hits in our custom callout.
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Check if it hit our annotation detail view components.
        
        print("Remzi: Hit Test tetiklendi")
        
        // details button
        if let result = addImageButton.hitTest(convert(point, to: addImageButton), with: event) {
            return result
        }
        
        // details button
        if let result = seeDetailsButton.hitTest(convert(point, to: seeDetailsButton), with: event) {
            return result
        }
        
        // fallback to our background content view
        return backgroundContentButton.hitTest(convert(point, to: backgroundContentButton), with: event)
    }
}
