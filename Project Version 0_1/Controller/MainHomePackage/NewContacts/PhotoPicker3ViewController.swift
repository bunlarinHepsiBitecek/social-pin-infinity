//
//  PhotoPicker3ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 19.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Photos

class PhotoPicker3ViewController: UIViewController {

    @IBOutlet var scrollViewForSelectedPicture: PhotoSpecialScrollView!
    @IBOutlet var collectionViewForPictures: UICollectionView!
    @IBOutlet var cancelTabBarButton: UIBarButtonItem!
    @IBOutlet var nextTabBarButton: UIBarButtonItem!
    
    var imagesFromLibrary = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        
        getImages()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImages() {
        let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
        
        assets.enumerateObjects({ (object, count, stop) in
            self.imagesFromLibrary.append(object)
        })
        
        //In order to get latest image first, we just reverse the array
        self.imagesFromLibrary.reverse()
        
        // To show photos, I have taken a UICollectionView
        self.collectionViewForPictures.reloadData()
    }
        
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        UIApplication.shared.isStatusBarHidden = false
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    

}
