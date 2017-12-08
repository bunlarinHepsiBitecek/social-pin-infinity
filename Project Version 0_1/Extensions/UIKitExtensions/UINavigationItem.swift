//
//  UINavigationItem.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 4.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    func eraseNavigationBarItemTitle() {
        
        title = SPACE_CHARACTER
        
    }
    
    func setNavigationBarItemTitleWithBrand() {
        
        title = PROJECT_PINBOOK
        
    }
    
    func setNavigationItemTitles() {
        
        print("setNavigationItemTitles starts")
        
        let action = #selector(takasi)
        
        backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: action)
        title = PROJECT_PINBOOK
        
    }
    
    @objc func takasi() {
        
        print("mina korum haaa")
        
    }
    
    
    
    
}
