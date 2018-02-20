//
//  CustomView.swift
//  Project Version 0_1
//
//  Created by Remzi on 03/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class CustomView: FeedCarouselItem {
    
    //MARK: outlets
    @IBOutlet var imageView: CachedImageView!
    
    // MARK: - properties
    fileprivate var containerView: UIView!
    fileprivate let nibName = "CustomView"
    
    // MARK: variable
    fileprivate var viewCreated = false
    
    var viewExists : Bool {
        get {
            return self.viewCreated
        }
        set {
            self.viewCreated = newValue
        }
    }
    
    
    // MARK: - init
    convenience init(frame: CGRect, number: Int) {
        self.init(frame: frame)
        
        // MARK Remzi: when customview created
        self.viewCreated = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if self.subviews.count == 0 {
            xibSetup()
            setup()
        }
    }
    
    func xibSetup() {
        containerView = loadViewFromNib()
        containerView.frame = bounds
        containerView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(containerView)
    }
    
    func loadViewFromNib() -> UIView {
        print("CustomView loadViewFromNib")
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    // MARK: - methods
    fileprivate func setup() {
        layer.masksToBounds = false
        layer.shadowRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.65
    }

}
