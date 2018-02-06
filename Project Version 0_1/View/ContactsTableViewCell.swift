//
//  ContactsTableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet var friendsImage: UIImageViewCustomDesign!
    @IBOutlet var friendsNameText: UILabel!
    @IBOutlet var friendSelectedImage: UIImageViewCustomDesign!
    
    var isCellSelected : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.backgroundColor = UIColor.red.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
