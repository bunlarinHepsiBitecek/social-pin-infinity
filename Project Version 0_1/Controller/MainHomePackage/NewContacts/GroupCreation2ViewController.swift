//
//  GroupCreation2ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 13.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class GroupCreation2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var collectionTableView: UITableView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var groupNameText: UITextField!
    @IBOutlet var groupImage: UIImageViewCustomDesign!
    
    var user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("GroupCreation2ViewController starts")
        
        collectionTableView.rowHeight = UITableViewAutomaticDimension
        collectionTableView.estimatedRowHeight = 500
        
        print("selectedFriendArray : \(selectedFriendArray.count)")
        
        groupNameText.borderStyle = .none
        
        NotificationCenter.default.addObserver(self, selector: #selector(takasi), name: NSNotification.Name(rawValue: "refresh"), object: nil)

        // Do any additional setup after loading the view.
        
        
        
    }

    @objc func takasi() {
        
        print("takasi starts")
        
        //collectionTableView.reloadSections([0], with: .automatic)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("tableview : numberOfRowsInSection starts")
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = collectionTableView.dequeueReusableCell(withIdentifier: "cellForCollectionView", for: indexPath) as! GroupCreation2TableViewCell

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        print("tableview : heightForRowAt starts")
        print("contentSize.contentSizeOfCell : \(contentSize.contentSizeOfCell)")
        
//        print("heightForRowAt starts")
//        print("indexPath : \(indexPath)")
//        print("contentSize.contentSizeOfCell : \(contentSize.contentSizeOfCell)")


        return contentSize.contentSizeOfCell

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    /*
     title for header of sections
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       
        return "Participant : " + String(selectedFriendArray.count)
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        friendsData.userSelectedFriendsCollectionViewData.removeAll()
        
        for item in friendsData.userFriendsDictionarySorted {
            
            friendSelectedDictionary[item.userID] = false
            
        }
        
        for item in selectedFriendArray {
            
            friendsData.userSelectedFriendsCollectionViewData.append(item)
            friendSelectedDictionary[item.userID] = true
            
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
