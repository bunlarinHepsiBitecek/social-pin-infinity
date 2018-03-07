//
//  GroupMembersTableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/3/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class GroupMembersTableViewCell: UITableViewCell {

    @IBOutlet var groupMemberName: UILabel!
    @IBOutlet var groupMemberImage: UIImageViewCustomDesign!
    
    var group = Group()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
