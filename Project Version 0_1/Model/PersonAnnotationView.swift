//
//  PersonAnnotationView.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

// MKPinAnnotationView().image , MKPointAnnotation()
private let kPersonMapPinImage = UIImage(named: "maps64.png")
//private let kPersonMapPinImage = MKPinAnnotationView().image

private let kPersonMapAnimationTime = 0.300

class PersonAnnotationView: MKAnnotationView {
    
    // data
    weak var personDetailDelegate: PersonPinDetailMapViewDelegate?
    weak var customCalloutView: PersonPinDetailMapView?
    override var annotation: MKAnnotation? {
        willSet { customCalloutView?.removeFromSuperview() }
    }
    
    // MARK: - life cycle
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.canShowCallout = false
        // pin style image change
        self.image = resizeImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.canShowCallout = false // This is important: Don't show default callout.
        // pin style image change
        self.image = resizeImage()
    }
    
    func resizeImage() -> UIImage {
        // Resize image
        let pinImage = kPersonMapPinImage
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContext(size)
        pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
    // MARK: - callout showing and hiding
    // Important: the selected state of the annotation view controls when the
    // view must be shown or not. We should show it when selected and hide it
    // when de-selected.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.customCalloutView?.removeFromSuperview() // remove old custom callout (if any)
            
            if let newCustomCalloutView = loadPersonDetailMapView() {
                // fix location from top-left to its right place.
                newCustomCalloutView.frame.origin.x -= newCustomCalloutView.frame.width / 2.0 - (self.frame.width / 2.0)
                newCustomCalloutView.frame.origin.y -= newCustomCalloutView.frame.height
                
                // set custom callout view
                self.addSubview(newCustomCalloutView)
                self.customCalloutView = newCustomCalloutView
                
                // animate presentation
                if animated {
                    self.customCalloutView!.alpha = 0.0
                    UIView.animate(withDuration: kPersonMapAnimationTime, animations: {
                        self.customCalloutView!.alpha = 1.0
                    })
                }
            }
        } else {
            if customCalloutView != nil {
                if animated { // fade out animation, then remove it.
                    UIView.animate(withDuration: kPersonMapAnimationTime, animations: {
                        self.customCalloutView!.alpha = 0.0
                    }, completion: { (success) in
                        self.customCalloutView!.removeFromSuperview()
                    })
                } else { self.customCalloutView!.removeFromSuperview() } // just remove it.
            }
        }
    }
    
    func loadPersonDetailMapView() -> PersonPinDetailMapView? {
        if let views = Bundle.main.loadNibNamed("PersonPinDetailMapView", owner: self, options: nil) as? [PersonPinDetailMapView], views.count > 0 {
            let personDetailMapView = views.first!
            personDetailMapView.delegate = self.personDetailDelegate
            if let personAnnotation = annotation as? PersonAnnotation {
                let person = personAnnotation.person
                personDetailMapView.configureWithPerson(person: person)
            }
            return personDetailMapView
        }
        return nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.customCalloutView?.removeFromSuperview()
    }
    
    // MARK: - Detecting and reaction to taps on custom callout.
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // if super passed hit test, return the result
        if let parentHitView = super.hitTest(point, with: event) { return parentHitView }
        else { // test in our custom callout.
            if customCalloutView != nil {
                return customCalloutView!.hitTest(convert(point, to: customCalloutView!), with: event)
            } else { return nil }
        }
    }
    
    
}
