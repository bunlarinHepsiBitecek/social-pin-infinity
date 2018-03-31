//
//  FeedCell.swift
//  Project Version 0_1
//
//  Created by Remzi on 03/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype Object
    func configure(object: Object, index: Int)
}

class FeedCell: UITableViewCell, FeedCarouselDelegate {
    
    //outlets
    @IBOutlet var carouselView: FeedCarousel!
    
    //variable
    weak var feed : Feed! {
        didSet {
            setupCarousel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutIfNeeded()
        
    }
    
    /*
     override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)
     
     // Configure the view for the selected state
     }
     */
    
    // MARK: - methods
    func setupCarousel() {
        
        // MARK: init the first index
        carouselView.backingSelectedIndex = feed.selectedIndex
        
        carouselView.delegate = self
        carouselView.margin = 10
        // MARK : when first load (selectedIndex = -1 ) set center view: eg when 3 image then index 1 selected
        carouselView.selectedIndex = feed.selectedIndex
        carouselView.type = .threeDimensional
    }
 
    func numberOfItemsInCarouselView(_ carouselView: FeedCarousel) -> Int {
        return feed.numberOfItem()
    }
    
    func carouselView(_ carouselView: FeedCarousel, itemForRowAtIndex index: Int) -> FeedCarouselItem {
        return feed.getCustomView(index: index)
    }
    
    func carouselView(_ carouselView: FeedCarousel, didSelectItemAtIndex index: Int) {
        feed.selectedIndex = index
    }
    
    func carouselView(_ carouselView: FeedCarousel, willDisplayItem item: FeedCarouselItem, forIndex index: Int) {
        print("----------")
    }
    
}


extension FeedCell: ConfigurableCell {
    func configure(object: Feed, index: Int) {
        feed = object
    }
}
