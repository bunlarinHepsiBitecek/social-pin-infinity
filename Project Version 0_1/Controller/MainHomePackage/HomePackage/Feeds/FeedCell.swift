//
//  FeedCell.swift
//  Project Version 0_1
//
//  Created by Remzi on 03/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell, FeedCarouselDelegate {
    
    //outlets
    @IBOutlet var carouselView: FeedCarousel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    //variable
    weak var feed : Feed!
    var customViews = [CustomView]()

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
    
    func setupProfilePicture() {
        profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.image = nil
    }
    
    // MARK: - methods
    func setupCarousel() {
        profileImage.loadImageUsingUrlString(urlString: feed.ownerUser.profilePictureURL)
        
        carouselView.delegate = self
        carouselView.margin = 10
        carouselView.selectedIndex = 1
        carouselView.type = .threeDimensional
    }
    
    func numberOfItemsInCarouselView(_ carouselView: FeedCarousel) -> Int {
        return feed.numberOfItem()
    }
    
    func carouselView(_ carouselView: FeedCarousel, itemForRowAtIndex index: Int) -> FeedCarouselItem {
        /*
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 100) , number: index)
        
        print("Rezik itemForRowAt: \(index)")
        print("Rezik locationID: \(feed.locationID)")
        
        switch index {
        case 0:
            customView.imageView.loadImageUsingUrlString(urlString: feed.pictureURL)
        case 1:
            customView.imageView.loadImageUsingUrlString(urlString: feed.videoPictureURL)
        case 2:
            customView.imageView.loadImageUsingUrlString(urlString: feed.textPictureURL)
        default:
            print("switch case default")
        }
        
        return customView */
        
        if customViews[index].viewExists {
            
        } else {
            let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 100) , number: index)
            customViews.append(customView)
        }
        return customViews[index]
    }
    
    func carouselView(_ carouselView: FeedCarousel, didSelectItemAtIndex index: Int) {
        print("Tap on item at index \(index)")
    }
    
    func carouselView(_ carouselView: FeedCarousel, willDisplayItem item: FeedCarouselItem, forIndex index: Int) {
        print("----------")
    }

}
