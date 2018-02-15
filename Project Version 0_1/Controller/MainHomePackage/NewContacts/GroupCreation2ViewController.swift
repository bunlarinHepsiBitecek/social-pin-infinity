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

    var tempCollectionViewContentSize = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("GroupCreation2ViewController starts")
        
        collectionTableView.rowHeight = UITableViewAutomaticDimension
        collectionTableView.estimatedRowHeight = 500
        
        print("selectedFriendArray : \(selectedFriendArray.count)")
        
        groupNameText.borderStyle = .none

        // Do any additional setup after loading the view.
        
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
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        print("estimatedHeightForRowAt starts")
//        print("UITableViewAutomaticDimension : \(UITableViewAutomaticDimension)")
//        
//        return UITableViewAutomaticDimension
//        
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    /*
     title for header of sections
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       
        return "takasi bomba"
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
