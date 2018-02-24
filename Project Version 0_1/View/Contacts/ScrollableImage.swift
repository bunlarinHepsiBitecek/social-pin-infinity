//
//  ScrollableImage.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/22/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

protocol ScrollableImageDeleagate {
    
    func touchBegan()
    func touchMoved()
    
}

class ScrollableImage : UIScrollView {
    
    var delegatePass: ScrollableImageDeleagate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        print("touchesBegan starts")

        self.delegatePass?.touchBegan()
        
        if self.isDragging {
            
            self.next?.touchesBegan(touches, with: event)
            
        } else {
            
            super.touchesBegan(touches, with: event)
            
        }
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.delegatePass?.touchMoved()
        
        if self.isDragging {
            
            self.next?.touchesMoved(touches, with: event)
            
        } else {
            
            super.touchesMoved(touches, with: event)
            
        }
        
    }
    
}
