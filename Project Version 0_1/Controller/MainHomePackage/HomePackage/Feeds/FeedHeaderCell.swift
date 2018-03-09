//
//  FeedHeaderCell.swift
//  Project Version 0_1
//
//  Created by Remzi on 03/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class FeedHeaderCell: UITableViewCell {
    
    //outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    //variable
    weak var feed : Feed!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutIfNeeded()
        
        setupProfilePicture()
    }
    
    /*
     override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)
     
     // Configure the view for the selected state
     }
     */
    
    // MARK: - methods
    func setupProfilePicture() {
        profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.image = nil
    }
    
    func setupHeaderView() {
        self.userName.text = feed.ownerUser.username
        self.profileImage.loadImageUsingUrlString(urlString: feed.ownerUser.userProfilePictureUrl)
    }
    
}

