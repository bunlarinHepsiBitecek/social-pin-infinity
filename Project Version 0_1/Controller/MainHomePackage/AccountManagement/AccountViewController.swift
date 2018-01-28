//
//  AccountViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    /*
        user object
     */
    var user = User()
    var sectionBasedObject = SectionBasedFriendsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("AccountViewController viewDidLoad starts")
        
        processNeedsToCompleteWhenViewLoaded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        print("AccountViewController viewDidAppear starts")
        
        //denemeCache2.setObject(sectionBasedObject, forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
        
        let temp = denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
        
        print("temp : \(temp?.tempUserFriendsDictionary.count)")
        print("temp : \(temp?.tempUserFriendsDictionarySorted.count)")
        print("temp : \(temp?.sectionDictionary.count)")
        
        
    }

    @IBAction func openAccountViewController(_ sender: Any) {
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.ContactsViewController_storyBoardID) as? ContactsViewController2 {
            
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func getUserObject() {
        
        if let tabBarController = self.tabBarController as? HomePageViewController {
            
            self.user = tabBarController.user
        }
        
        print("self.user : \(user.userID)")
        
    }
    
    func processNeedsToCompleteWhenViewLoaded() {
        
        getUserObject()
        
    }
}
