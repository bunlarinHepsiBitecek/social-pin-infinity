//
//  AccountViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet var denemeLabel: UILabel!
    /*
        user object
     */
    var user = User()
    var sectionBasedFriendsDataObject = SectionBasedFriendsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("AccountViewController viewDidLoad starts")
        
        processNeedsToCompleteWhenViewLoaded()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openAccountViewController(_ sender: Any) {
        
        /*
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.ContactsViewController_storyBoardID) as? ContactsViewController2 {
            
            
            present(destinationViewController, animated: true, completion: nil)
            
        }*/
        
        /*
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.ContactsNewTableViewController_storyBoardID) as? ContactsNewTableViewController {
            
            
            present(destinationViewController, animated: true, completion: nil)
            
        }*/
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.ContactsNewViewController_storyBoardID) as? ContactsNewViewController {
            
            //destinationViewController.friendsData = self.sectionBasedFriendsDataObject
            friendsData = self.sectionBasedFriendsDataObject
            destinationViewController.user = self.user
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func getUserObject() {
        
        print("getUserObject starts")
        
        if let tabBarController = self.tabBarController as? HomePageViewController {
            
            self.user = tabBarController.user
            self.sectionBasedFriendsDataObject = tabBarController.sectionBasedFriendsDataObject
            
            print("data : \(sectionBasedFriendsDataObject.userFriendsDictionary.count)")
            
        }
        
        print("self.user : \(user.userID)")
        
    }
    
    func processNeedsToCompleteWhenViewLoaded() {
        
        getUserObject()
        
    }
}
