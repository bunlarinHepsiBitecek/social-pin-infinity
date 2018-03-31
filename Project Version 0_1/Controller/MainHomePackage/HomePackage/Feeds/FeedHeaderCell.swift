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
    @IBOutlet weak var locationDetail: UIButton!
    
    //variable
    weak var feed : Feed? {
        didSet {
            if let userName = feed?.ownerUser.username {
//                self.userName.text = userName
                self.userName.text = userName + "-" + (feed?.location.locationId)!
            }
            
            if let pictureUrl = feed?.ownerUser.userProfilePictureUrl {
                self.profileImage.loadImageUsingUrlString(urlString: pictureUrl)
            }
            
            setupLocationDetail()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutIfNeeded()
        
        setupHeader()
    }
    
    /*
     override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)
     
     // Configure the view for the selected state
     }
     */
    
    // MARK: - methods
    private func setupHeader() {
        profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.image = nil
        userName.text = SPACE_CHARACTER
    }
    
    private func setupLocationDetail() {
        guard let feed = feed else { return }
        
        let attributedText = NSMutableAttributedString(string: "\(feed.locationToString())  •  ")
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "ic_pin_drop")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        locationDetail.setAttributedTitle(attributedText, for: .normal)
    }
    
}


extension UIColor{
    static func returnRGBColor(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

