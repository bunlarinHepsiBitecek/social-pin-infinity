//
//  CommonFunctionsForGroupContainer.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/3/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContainerGroupsTableViewController {
    
    func openActionsForGroupInfo() {
        
        let groupInfoAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let infoFlowAction = UIAlertAction(title: CommonConstants.AlertControllerConstants.Titles.titleGroupInfo, style: .default) { (alertAction) in
            
            print("Info tapped")
            
            self.gotoInfoView()
            
        }
        
        let exitGroupAction = UIAlertAction(title: CommonConstants.AlertControllerConstants.Titles.titleExitGroup, style: .destructive) { (alertAction) in
            
            print("Exit group tapped")
            
        }
        
        let cancelAlertAction = UIAlertAction(title: CommonConstants.AlertControllerConstants.Titles.titleCancel, style: .cancel) { (alertAction) in
            
            print("Cancel is tapped")
            
        }
        
        groupInfoAlertController.addAction(infoFlowAction)
        groupInfoAlertController.addAction(exitGroupAction)
        groupInfoAlertController.addAction(cancelAlertAction)
        
        self.present(groupInfoAlertController, animated: true, completion: nil)
        
    }
    
    func gotoInfoView() {
     
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.GroupInfoViewController_storyBoardID) as? GroupInfoViewController {
            
            destinationViewController.groupID = groupObject.groupID
            destinationViewController.group = groupObject
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
    
    
}
