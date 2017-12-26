//
//  UIViewExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setViewBackgroundColourShadow() {

        backgroundColor = UIColor(white: 1, alpha: 0.9)
        
    }
    
    func resetViewBackgroundColor() {
        
        backgroundColor = UIColor(white: 1, alpha: 1.0)
        
    }
    
    func createImage(nibName: String) -> UIImage {
        var image: UIImage = UIImage()
        
        if let views = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) as? [PersonPinDetailMapView], views.count > 0 {
            
            let personDetailMapView = views.first!
            
            image = personDetailMapView.createImage()
            
        }
        return image
    }
    
    func createImage() -> UIImage {
        
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            let rect: CGRect = self.frame
            
            UIGraphicsBeginImageContext(rect.size)
            let context: CGContext = UIGraphicsGetCurrentContext()!
            self.layer.render(in: context)
            let img = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
            return img
        }
        
    }
    
    
}
