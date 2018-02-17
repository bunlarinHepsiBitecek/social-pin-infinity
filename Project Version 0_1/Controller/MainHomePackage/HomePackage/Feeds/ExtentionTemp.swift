//
//  ExtentionTemp.swift
//  Project Version 0_1
//
//  Created by Remzi on 10/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, DiscardableImageCacheItem>()

extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String ) {
        
        self.image = nil
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlKey = urlString as NSString
        
        
        if let cachedItem = imageCache.object(forKey: urlKey) {
           self.image = cachedItem.image
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    print("image geldi")
                    let cacheItem = DiscardableImageCacheItem(image: image)
                    imageCache.setObject(cacheItem, forKey: urlKey)
                    self?.image = image
                }
            }
            
        }).resume()
    }
}
