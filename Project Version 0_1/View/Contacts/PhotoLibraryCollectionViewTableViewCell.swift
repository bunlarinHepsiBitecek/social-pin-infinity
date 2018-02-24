//
//  PhotoLibraryCollectionViewTableViewCell.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/21/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PhotoLibraryCollectionViewTableViewCell: UITableViewCell {

    var collectionViewForPhotos = UICollectionView()
    var imageViewForCell = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
