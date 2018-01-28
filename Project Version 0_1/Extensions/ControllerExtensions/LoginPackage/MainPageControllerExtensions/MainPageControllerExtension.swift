//
//  MainPageControllerExtension.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 25.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

extension MainPageViewController {
    
    func directToWelcomeFirstPin() {
        
        let newView = storyboard?.instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.FromMainBoardToWelcomeFirstPinBoard_storyBoardID) as! WelcomeFirstPinViewController
        
        newView.user = user
        
        navigationController?.pushViewController(newView, animated: true)
        
    }
    
    func directCurrentPageToEntrancePage() {
        
        
        let entranceViewControllerObject = storyboard?.instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.EntranceVC_storyBoardID) as! EntranceViewController
        
        navigationController?.pushViewController(entranceViewControllerObject, animated: true)
        
    }
    
    func checkUserRegisterFirstTime() {
        
        if information.callerView == "callerVerification" {
            
            performSegue(withIdentifier: "goToWelcomeFirstPin", sender: self)
            
        }
        
    }
    
}
