//
//  DetailHeaderView.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/6/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class DetailHeaderView : UIView {
    
    @IBOutlet weak var imageView : UIImageView!
    
    var image : UIImage? {
        
        didSet {
            
            if let image = image {
                
                imageView.image = image
                
            } else {
                
                imageView.image = nil
                
            }
            
        }
        
    }
    
    
}
