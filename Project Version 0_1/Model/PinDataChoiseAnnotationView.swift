//
//  PinDataChoiseAnnotationView.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 18.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

//private let pinImage = MKPinAnnotationView().image
private let pinImageData = UIImage(named: "maps64.png")
private let pinImageAnimationTime = 0.300

class PinDataChoiseAnnotationView: MKAnnotationView {

    weak var pinDataChoiseDelegate: PinDataChoiseViewDelegate?
    weak var customCalloutView: PinDataChoiseView?
    
    override var annotation: MKAnnotation? {
        willSet { customCalloutView?.removeFromSuperview() }
    }

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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("setSelected is activated")
        print("selected : \(selected)")
        
        if selected {
            self.customCalloutView?.removeFromSuperview() // remove old custom callout (if any)
            
            print("check_1")
            
            if let newCustomCalloutView = loadPinDataChoiseView() {
                
                print("check_2")
                
                // fix location from top-left to its right place.
                newCustomCalloutView.frame.origin.x -= newCustomCalloutView.frame.width / 2.0 - (self.frame.width / 2.0)
                newCustomCalloutView.frame.origin.y -= newCustomCalloutView.frame.height
                
                // set custom callout view
                self.addSubview(newCustomCalloutView)
                self.customCalloutView = newCustomCalloutView
                
                // animate presentation
                
                print("animated : \(animated)")
                
                if animated {
                    
                    print("check_3")
                    
                    self.customCalloutView!.alpha = 0.0
                    UIView.animate(withDuration: pinImageAnimationTime, animations: {
                        self.customCalloutView!.alpha = 1.0
                    })
                }
            }
        } else {
            
            print("check_4")
            
            if customCalloutView != nil {
                
                print("check_5")
                
                if animated { // fade out animation, then remove it.
                    
                    print("check_6")
                    
                    UIView.animate(withDuration: pinImageAnimationTime, animations: {
                        self.customCalloutView!.alpha = 0.0
                    }, completion: { (success) in
                        self.customCalloutView!.removeFromSuperview()
                    })
                } else { self.customCalloutView!.removeFromSuperview() } // just remove it.
            }
        }
    }
    
    func loadPinDataChoiseView() -> PinDataChoiseView? {
        
        print("loadPinDataChoiseView starts")
        
        if let views = Bundle.main.loadNibNamed("PinDataChoiseView", owner: self, options: nil) as? [PinDataChoiseView],
            
            views.count > 0 {
            
            let pinDataChoiseView = views.first!
            
            pinDataChoiseView.delegateForPinDataChoiseView = self.pinDataChoiseDelegate
            
            return pinDataChoiseView
        }
        
        return nil
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.customCalloutView?.removeFromSuperview()
    }
    
    func resizeImage() -> UIImage {
        // Resize image
        let pinImage = pinImageData
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContext(size)
        pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
    
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
