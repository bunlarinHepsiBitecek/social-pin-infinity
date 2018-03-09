//
//  PhotoPickerTableViewCellExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/8/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension PhotoPickerTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionViewForGallery.dequeueReusableCell(withReuseIdentifier: CommonConstants.TableViewConstants.CellConstants.CellCollectionViewPhotoLibrary, for: indexPath) as? PhotoPickerCollectionViewCell  else {
            
            return UICollectionViewCell()
        }
        
        cell.photoRetrievedFromGallery.image = UIImage(named: "user.png")
        
        return cell
        
    }
    
    

    
}
