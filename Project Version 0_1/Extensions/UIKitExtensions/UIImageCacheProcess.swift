//
//  UIImageCacheProcess.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 7.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /*
        function below is used for setting cached images for friendlist or getting data from firebase if user
        reopen application and load data async to cache for further uses
     */
    func setImagesFromCacheOrFirebase(_ urlString: String) {
        
        print("setImagesFromCacheOrFirebase starts")
        
        self.image = nil
        
        if let tempImage = cachedFriendProfileImages.object(forKey: urlString as NSString) {
            
            image = tempImage
            
        } else {
            
            if !urlString.isEmpty {
                
                let url = URL(string: urlString)
                
                let request = URLRequest(url: url!)
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                    
                    if error != nil {
                        
                        if let errorMessage = error as NSError? {
                            
                            print("errorMessage : \(errorMessage.localizedDescription)")
                            
                        }
                        
                    } else {
                        
                        if let image = UIImage(data: data!) {
                            
                            DispatchQueue.main.async(execute: {
                                
                                cachedFriendProfileImages.setObject(image, forKey: urlString as NSString)
                                
                                self.image = image
                                
                            })
                        }
                    }
                })
                
                task.resume()
            }
        }
    }
    
    /*
        function below is used to get userProfile picture
        either data will retrieve from firebase or cache
     */
    func getProfileImage(_ urlString: String) {
        
        print("getProfileImage starts")
        print("urlString : \(urlString)")
        
        self.image = nil
        
        if let tempImage = cachedProfilePicture.object(forKey: urlString as NSString) {
            
            print("erku1")
            
            image = tempImage
            
        } else {
            
            print("erku2")
            
            if !urlString.isEmpty {
                
                print("erku3")
                
                let url = URL(string: urlString)
                
                let request = URLRequest(url: url!)
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                    
                    if error != nil {
                        
                        if let errorMessage = error as NSError? {
                            
                            print("errorMessage : \(errorMessage.localizedDescription)")
                            
                        }
                        
                    } else {
                        
                        print("erku4")
                        
                        if let image = UIImage(data: data!) {
                            
                            print("erku5")
                            
                            DispatchQueue.main.async(execute: {
                                
                                print("erku6")
                                
                                cachedProfilePicture.setObject(image, forKey: urlString as NSString)
                                
                                self.image = image
                                
                            })
                        }
                    }
                })
                
                task.resume()
            }
        }
    }
    
    
        
}
