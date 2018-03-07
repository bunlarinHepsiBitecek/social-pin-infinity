//
//  TableViewExtension.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/28/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContainerGroupsTableViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt starts----------------------------")
        print("indexPath :\(indexPath)")
        
        let cell : GroupTableViewCell = {
            
            guard let cell = tableViewGroups.dequeueReusableCell(withIdentifier: CommonConstants.TableViewConstants.CellConstants.groupsCell) as? GroupTableViewCell else {
                
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: CommonConstants.TableViewConstants.CellConstants.groupsCell) as! GroupTableViewCell
            }
            return cell as GroupTableViewCell
        }()
        
        cell.groupObj = constantUserGroupDataObject.arrangeSectionDataForGroupSegment(inputIndexPath: indexPath)
        
        cell.groupName.text = cell.groupObj.groupName
        
        cell.groupImage.setImagesFromCacheOrFirebase(cell.groupObj.groupPictureUrl, inputChannel: .groups)
        
        print("groupObject groupID :\(cell.groupObj.groupID)")
        print("groupObject groupName :\(cell.groupObj.groupName)")
        
        
        for item in groupObject.groupMembers {
            
            print("item :\(item.userFriendChildData.userName)")
            print("item :\(item.userFriendChildData.userImageUrl)")
            
        }
        
        
        cell.accessoryType = .disclosureIndicator
        
        print("cellForRowAt ends----------------------------")
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return constantUserGroupDataObject.calculateNumberOfSectionsForGroups(inputSectionValue: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return constantUserGroupDataObject.keyData.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return constantUserGroupDataObject.keyData[section]
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        print("group tableview editing is activated")
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let cellAtIndex = tableView.cellForRow(at: indexPath) as! GroupTableViewCell
        
        groupObject = cellAtIndex.groupObj
        
        print("groupObject groupID :\(groupObject.groupID)")
        print("groupObject groupName :\(groupObject.groupName)")
        

        for item in groupObject.groupMembers {
            
            print("item :\(item.userFriendChildData.userName)")
            print("item :\(item.userFriendChildData.userImageUrl)")
            
        }
        
        
        
        print("indexPath.section :\(indexPath.section)")
        print("indexPath.row :\(indexPath.row)")
        
        let delete = UITableViewRowAction(style: .destructive, title: CommonConstants.TableViewEditingStyleButtons.Delete) { (action, indexPath) in

        }
        
        
        
        let info = UITableViewRowAction(style: .default, title: CommonConstants.TableViewEditingStyleButtons.More) { (action, indexPath) in

            
            print("ahanda infoya bastim")
            
            self.openActionsForGroupInfo()
            
            
        }
        
        
        info.backgroundColor = UIColor.lightGray
        
        return [delete, info]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print("didselect is activated")
        print("indexPath :\(indexPath)")
        
        let cell = tableView.cellForRow(at: indexPath) as! GroupTableViewCell
        
    
        print("cell groupName :\(cell.groupObj.groupName)")
        print("cell groupID :\(cell.groupObj.groupID)")
        print("cell groupMembers.count :\(cell.groupObj.groupMembers.count)")
        
        
        
    }
    
    
    
}



























