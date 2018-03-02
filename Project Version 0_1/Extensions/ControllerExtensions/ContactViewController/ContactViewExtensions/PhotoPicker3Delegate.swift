//
//  PhotoPicker3Delegate.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 19.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Photos

extension PhotoPicker3ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imagesFromLibrary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewForPictures.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoLibraryCollectionViewCell
        
        //cell.photo.image = UIImage(named: "user.png")
        
        let asset = imagesFromLibrary[indexPath.row]
        let manager = PHImageManager.default()
        let size = CGSize(width: 93.0, height: 93.0)
        
        /*
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat*/
        
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: nil, resultHandler: { (image, attributes) in
            
            cell.photo.image = image
            
        })
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoLibraryCollectionViewCell
        
        let asset = imagesFromLibrary[indexPath.row]
        
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat
        
        PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options, resultHandler: { (image, attributes) in
            
            DispatchQueue.main.async {
                self.scrollViewForSelectedPicture.imageToDisplay = image
            }
            
            
            
        })
        
        
        
    }
    
    
    
    
}
