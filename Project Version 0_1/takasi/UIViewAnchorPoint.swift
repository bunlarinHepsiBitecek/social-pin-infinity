//
//  UIViewAnchorPoint.swift
//  DesignableXTesting
//
//  Created by Mark Moeykens on 1/16/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

    import UIKit

    @IBDesignable
    class UIViewAnchorPoint: UIView {
        
        @IBInspectable var showAnchorPoint: Bool = false
        @IBInspectable var anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5) {
            didSet {
                setAnchorPoint(anchorPoint: anchorPoint)
            }
        }
        
       
        
        func setAnchorPoint(anchorPoint: CGPoint) {
            var newPoint = CGPoint(x: bounds.size.width * anchorPoint.x, y: bounds.size.height * anchorPoint.y)
            var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)
            
            newPoint = newPoint.applying(transform)
            oldPoint = oldPoint.applying(transform)
            
            var position = layer.position
            position.x -= oldPoint.x
            position.x += newPoint.x
            
            position.y -= oldPoint.y
            position.y += newPoint.y
            
            layer.position = position
            layer.anchorPoint = anchorPoint
        }
    }
