//
//  ContactsViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var searchController: UISearchBar!
    
    let sections = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //var sectionDictionary = Dictionary<String, [UserFriend]>()
    var sectionDictionary = NSDictionary() as! [String : [UserFriend]]
    
    var section = [String]()
    var bokkafa = NSDictionary() as! [String : [UserFriend]]
    
    var eList = [UserFriend]()
    var sList = [UserFriend]()
    var tList = [UserFriend]()
    
    var keys = Array<String>()
    
    var userFriendsObj = UserFriends()
    var userFriendList = [UserFriend]()
    
    var userFriendListForTableCells = [UserFriend]()
    
    var userFriendListSorted = [UserFriend]()
    var userFriendData = UserFriend()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchController.backgroundColor = UIColor.clear
        
        userFriendsObj = denemeCache.object(forKey: "data" as NSString)!
        userFriendList = userFriendsObj.userFriendList
        
        userFriendListSorted = userFriendList.sorted(by: { $0.userFriendChildData.userName < $1.userFriendChildData.userName })
        
        yarro()
        yarroE()
        
        print("keys : \(keys)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
        tableView override functions
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.friendsCell, for: indexPath) as! ContactsTableViewCell
        
        if indexPath.section == 0 {
            
            userFriendData = bokkafa[keys[indexPath.section]]![indexPath.row]
            
        } else if indexPath.section == 1 {
            
            userFriendData = bokkafa[keys[indexPath.section]]![indexPath.row]
            
        } else if indexPath.section == 2 {
            
            userFriendData = bokkafa[keys[indexPath.section]]![indexPath.row]
            
        }
        
        cell.friendsImage.image = userFriendData.userImage
        cell.friendsNameText.text = userFriendData.userFriendChildData.userName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("numberOfRowsInSection starts")
        print("section : \(section)")
        print("keys[section] : \(keys[section])")
        
        if keys[section] == "E" {
            
            return (bokkafa["E"]?.count)!
            
        } else if keys[section] == "S" {
            
            return (bokkafa["S"]?.count)!
        
        } else if keys[section] == "T" {
            
            return (bokkafa["T"]?.count)!
            
        } else {
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return keys[section]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return keys.count
    }
    
    func dada() {
        
        var counter = 0
        var flag_e = false
        var flag_s = false
        
        for item in userFriendListSorted {
            
            if item.userFriendChildData.userName.first == "E" {
                
                sectionDictionary["E"]?.append(item)
                
                if !flag_e {
                    
                    section.append("E")
                    flag_e = true
                }
                
            }
            
            if item.userFriendChildData.userName.first == "T" {
                
                sectionDictionary["T"]?.append(item)
                
                if !flag_e {
                    
                    section.append("T")
                    flag_e = true
                }
                
            }
            
            
            if item.userFriendChildData.userName.first == "S" {
                
                sectionDictionary["S"]?.append(item)
                
                if !flag_s {
                    
                    section.append("S")
                    flag_s = true
                }
                
            }
            
        }
        
    }
    
    
    func yarro() {
        
        for item in userFriendListSorted {
        
            if item.userFriendChildData.userName.first == "E" {
                
                eList.append(item)
            }
            
            if item.userFriendChildData.userName.first == "S" {
                
                sList.append(item)
                
            }
            
            if item.userFriendChildData.userName.first == "T" {
                
                tList.append(item)
                
            }
            
        }
        
        
    }

    func yarroE() {

        bokkafa["E"] = eList
        bokkafa["S"] = sList
        bokkafa["T"] = tList
        
        keys = Array(bokkafa.keys).sorted()
        
        print("bokkafa[1] : \(bokkafa["E"])")
        print("bokkafa[2] : \(bokkafa["S"])")
    }
    

}

