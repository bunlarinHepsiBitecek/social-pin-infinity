//
//  GroupTableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/2/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet var groupImage: UIImageViewCustomDesign!
    @IBOutlet var groupName: UILabel!
    @IBOutlet var groupSelectedImage: UIImageViewCustomDesign!
    
    var groupObj = Group()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
