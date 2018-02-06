//
//  ContactsNewTableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ContactsNewTableViewCell: UITableViewCell {

    @IBOutlet var friendName: UILabel!
    @IBOutlet var friendImage: UIImageViewCustomDesign!
    @IBOutlet var friendSelectedImage: UIImageViewCustomDesign!
    
    var friend = UserFriend()
    
    var isCellSelected : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        print("setSelected is clicked")
        
        super.setSelected(selected, animated: true)
        
    }*/
    
}
