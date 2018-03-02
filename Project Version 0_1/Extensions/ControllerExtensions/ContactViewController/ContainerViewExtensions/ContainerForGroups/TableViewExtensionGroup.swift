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
        
        let cell : yarroTableViewCell = {
            
            guard let cell = tableViewGroups.dequeueReusableCell(withIdentifier: TableViewConstants.CellConstants.groupsCell) as? yarroTableViewCell else {
                
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: TableViewConstants.CellConstants.groupsCell) as! yarroTableViewCell
            }
            return cell as yarroTableViewCell
        }()
        
        cell.groupObj = constantUserGroupDataObject.arrangeSectionDataForGroupSegment(inputIndexPath: indexPath)
        
        cell.groupName.text = cell.groupObj.groupName
        
        cell.groupImage.image = UIImage(named: "user.png")
        
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
    
    
}
