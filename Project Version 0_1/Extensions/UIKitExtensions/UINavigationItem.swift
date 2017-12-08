//
//  UINavigationItem.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 4.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    func setNavigationItemTitles() {
        
        print("setNavigationItemTitles starts")
        
        backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        title = PROJECT_PINBOOK
        
    }
    
}
