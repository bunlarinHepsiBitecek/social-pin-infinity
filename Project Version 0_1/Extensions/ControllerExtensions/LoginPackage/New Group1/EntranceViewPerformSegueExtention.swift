//
//  EntranceViewPerformSegueExtention.swift
//  Project Version 0_1
//
//  Created by Remzi on 08/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit


extension EntranceViewController {
    
    func gotoMainPage() {
        
        let mainPageViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "mainPageVC_storyBoardID") as! MainPageViewController
        
        mainPageViewControllerObject.user = self.user
        navigationController?.pushViewController(mainPageViewControllerObject, animated: true)
        
    }
    
}


