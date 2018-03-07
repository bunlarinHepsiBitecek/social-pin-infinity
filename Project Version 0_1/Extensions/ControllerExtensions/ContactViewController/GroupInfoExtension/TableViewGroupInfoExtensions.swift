//
//  TableViewGroupInfoExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/3/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension GroupInfoViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("constantUserGroupDataObject.userGroupSortedDictionary[groupID]?.groupMembers.count : \(constantUserGroupDataObject.userGroupSortedDictionary[groupID]?.groupMembers.count)")
        
        return (constantUserGroupDataObject.userGroupSortedDictionary[groupID]?.groupMembers.count)!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        print("indexPath : \(indexPath)")
        print("indexPath.row : \(indexPath.row)")
        print("indexPath.section : \(indexPath.section)")
        
        let cell : GroupMembersTableViewCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommonConstants.TableViewConstants.CellConstants.groupMembersCell) as?
                GroupMembersTableViewCell else {
             
                    return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: CommonConstants.TableViewConstants.CellConstants.groupMembersCell) as! GroupMembersTableViewCell
            }
            
            return cell as GroupMembersTableViewCell
            
        }()
        
        cell.groupMemberName.text = "yarro"
        cell.groupMemberImage.image = UIImage(named: "user.png")
        
        print("groupID : \(groupID)")
        cell.group = constantUserGroupDataObject.userGroupSortedDictionary[groupID]!
        
        print("cell.group.groupMembers[indexPath.row].userFriendChildData.userName : \(cell.group.groupMembers[indexPath.row].userFriendChildData.userName)")
        
        cell.groupMemberName.text = cell.group.groupMembers[indexPath.row].userFriendChildData.userName
        //cell.groupMemberImage.image = cell.group.groupMembers[indexPath.row].userImage
        cell.groupMemberImage.setImagesFromCacheOrFirebase(cell.group.groupMembers[indexPath.row].userFriendChildData.userImageUrl, inputChannel: .groupMembers)
        
        return cell
        
    }
    
    @objc func headersTapped() {
        
        print("bastim aq yaaaa bastimmmmmm")
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.GroupInfoChangedViewController_storyBoardID) as? GroupInfoChangedViewController {
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableViewGroupInfo.dequeueReusableCell(withIdentifier: CommonConstants.TableViewConstants.CellConstants.headerCellGroupInfo) as! GroupMemberHeaderTableViewCell
        
        //cell.groupNameButton.setTitle(group.groupName, for: .normal)
        
        cell.groupNameLabel.text = group.groupName
        
        cell.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        cell.accessoryType = .disclosureIndicator
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(headersTapped))
        
        cell.addGestureRecognizer(gestureRecognizer)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60
        
    }
    
    
    
    
    
}
