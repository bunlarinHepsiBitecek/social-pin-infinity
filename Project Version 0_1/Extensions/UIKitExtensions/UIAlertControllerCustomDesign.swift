//
//  UIAlertControllerCustomDesign.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 4.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func setGradientBackground() {
        
        print("setGradientBackground starts")
        
        let layer_x = self.view.layer as? CAGradientLayer
        
        layer_x?.colors = [ UIColor.yellow, UIColor.red ]
        
        layer_x?.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer_x?.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        print(self.view.layer)
        print(layer_x)
        
    }
    
    func boko() {
    
        view.applyGradient(colours: [UIColor.red, UIColor.green])
        view.layer.cornerRadius = 30
        
    }
    
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        clipsToBounds = true
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        layer.insertSublayer(gradient, at: 0)
    }
}
