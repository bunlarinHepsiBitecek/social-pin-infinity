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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutIfNeeded()
        
        setupProfilePicture()
        setupCarousel()
        
//        let imageUrlString = "https://firebasestorage.googleapis.com/v0/b/social-media-infinity.appspot.com/o/Users%2FProfileImages%2F291BF881-8A4B-4C7E-8584-62D9B79A621A.png?alt=media&token=e55de74d-52ba-4e29-aed0-204a1ae009be"
//        profileImage.loadImageUsingUrlString(urlString: imageUrlString)
        
        // TODO: SİL
        if feed != nil {
            print("FeedCell feedPictureURL: \(feed.pictureURL)")
        } else {
            print("FeedCell feed nill")
        }
        
        //profileImage.loadImageUsingUrlString(urlString: feed.ownerUser.profilePictureURL)
        
        
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
    }
    
    // MARK: - methods
    fileprivate func setupCarousel() {
        
        carouselView.delegate = self
        carouselView.margin = 10
        carouselView.selectedIndex = 1
        carouselView.type = .threeDimensional
    }
    
    func numberOfItemsInCarouselView(_ carouselView: FeedCarousel) -> Int {
        return 3
    }
    
    func carouselView(_ carouselView: FeedCarousel, itemForRowAtIndex index: Int) -> FeedCarouselItem {
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 100) , number: index)
        
//        // TODO: Sil
//        let imageName = "remzi_profile\(index + 1).jpg"
//        customView.imageView.image = UIImage(named: imageName)
//        // TODO: Sil
        
        print("Rezik itemForRowAt: \(index)")
        
        /*
        switch index {
        case 0:
            customView.imageView.loadImageUsingUrlString(urlString: feed.pictureURL.absoluteString!)
        case 1:
            customView.imageView.loadImageUsingUrlString(urlString: feed.videoPictureURL.absoluteString!)
        case 2:
            customView.imageView.loadImageUsingUrlString(urlString: feed.textPictureURL.absoluteString!)
        default:
            print("switch case default")
        } */
        
        return customView
    }
    
    func carouselView(_ carouselView: FeedCarousel, didSelectItemAtIndex index: Int) {
        print("Tap on item at index \(index)")
    }
    
    func carouselView(_ carouselView: FeedCarousel, willDisplayItem item: FeedCarouselItem, forIndex index: Int) {
        print("----------")
    }

}
