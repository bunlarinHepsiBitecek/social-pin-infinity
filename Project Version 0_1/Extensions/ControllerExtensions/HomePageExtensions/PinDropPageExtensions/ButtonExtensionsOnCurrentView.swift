//
//  ButtonExtensionsOnCurrentView.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 13.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension PinDropViewController {
    
    func mainPinDropButtonBackgroundProcessInitiate() {
        
        // decide if buttonPinDropMain animate pin drop buttons or save, delete pin buttons
    
        if !pinDataObject.isPinDropped {
            
            animateSpecificPinDropButtons()
            
        }
        
    }
    
    func animateConfirmationButtons() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonSavePinData.center = self.pinDropObjects.pinButtonConfirm
            self.buttonDeletePindData.center = self.pinDropObjects.pinButtonDelete
            
        }
        
    }
    
    func animateSpecificPinDropButtons() {
        
        // when viewDidLoad initial value of mainPinDropButtonClicked is false
        
        if mainPinDropButtonClicked {
            
            animatedRelocateSpecificPinDropButtonsBehindMainDropButton()
            
            mainPinDropButtonClicked = false
            
        } else {
            
            animatedRelocateSpecificPinDropButtonsToOriginalLocations()
            
            mainPinDropButtonClicked = true
        }
        
    }
    
    func animatedRelocateSpecificPinDropButtonsToOriginalLocations() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.relocateSpecificPinDropButtonsToOriginalLocations()
            
        }
        
    }
    
    func animatedRelocateSpecificPinDropButtonsBehindMainDropButton() {
    
        UIView.animate(withDuration: 0.3) {
            
            self.relocateSpecificPinDropButtonsBehindMainDropButton()
            
        }
        
    }
    
    func relocateSpecificPinDropButtonsBehindMainDropButton() {
        
        print("relocateSpecificPinDropButtonsBehindMainDropButton starts")
        print("userProfilePictureUrl :\(user.userProfilePictureUrl)")
        
        print("-----> : \(buttonPinDropOnlyMe.imageView?.image)")
        
        setImageFromCacheToButtonOnlyMe(inputUrl: user.userProfilePictureUrl)
        //setImageToButtonPinDropOnlyMe(inputImage: self.user.userProfilePicture)
        
        pinDropObjects.pinButtonAllFriends = self.buttonPinDropAllFriends.center
        pinDropObjects.pinButtonOnlyMe = self.buttonPinDropOnlyMe.center
        pinDropObjects.pinButtonSpecialPersonOrGroup = self.buttonPinDropSpecialFriends.center
        pinDropObjects.pinButtonConfirm = self.buttonSavePinData.center
        pinDropObjects.pinButtonDelete = self.buttonDeletePindData.center
        
        setAllPinDropButtonsBehindMainPinDropButton(inputCenterValue: self.buttonPinDropMain.center)
        
    }
    
    func relocateSpecificPinDropButtonsToOriginalLocations() {
        
        setImageFromCacheToButtonOnlyMe(inputUrl: user.userProfilePictureUrl)
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonPinDropSpecialFriends.center = self.pinDropObjects.pinButtonSpecialPersonOrGroup
            self.buttonPinDropAllFriends.center = self.pinDropObjects.pinButtonAllFriends
            self.buttonPinDropOnlyMe.center = self.pinDropObjects.pinButtonOnlyMe
            
        }
        
    }
    
    func setImageToButtonPinDropOnlyMe(inputImage: UIImage) {
        
        print("setImageToButtonPinDropOnlyMe starts")
        self.buttonPinDropOnlyMe.setImage(inputImage, for: .normal)
        
    }
    
    func setAllPinDropButtonsBehindMainPinDropButton(inputCenterValue : CGPoint) {
        
        self.buttonPinDropOnlyMe.center = inputCenterValue
        self.buttonPinDropAllFriends.center = inputCenterValue
        self.buttonPinDropSpecialFriends.center = inputCenterValue
        self.buttonSavePinData.center = inputCenterValue
        self.buttonDeletePindData.center = inputCenterValue
            
        
    }
    
    /*
        specific pin drop button functions
     */
    
    /*
        functions for all friend pin drop buttons
     */
    func startAnimateForAllFriendPinDropProcess(inputCGPointValue: CGPoint, completion: (_ result: Bool) -> Void) {
        
        pinDropObjects.pinButtonAllFriendsClicked = true
        
        hideSpecificPinDropButtonsBehindMainButton(inputCGPointValue: inputCGPointValue)
        
        dropPinOnMap()
        
        completion(true)
        
    }
    
    func allFriendPinDropButtonBackgroundProcessInitiate() {
        
        print("allFriendPinDropButtonBackgroundProcessInitiate starts")
        
        startAnimateForAllFriendPinDropProcess(inputCGPointValue: self.buttonPinDropMain.center) { (result) in
            
            print("result : \(result)")
            
            if result {
                
                self.buttonPinDropMain.setImage(self.buttonPinDropAllFriends.currentImage, for: .normal)
                
                doTheAnimationForConfirmationButtons()
                
            }
            
        }
        
    }
    
    /*
     functions for only me pin drop buttons
     */
    func startAnimateForOnlyMePinDropProcess(inputCGPointValue: CGPoint, completion: (_ result: Bool) -> Void) {
        
        pinDropObjects.pinButtonOnlyMeClicked = true
        
        hideSpecificPinDropButtonsBehindMainButton(inputCGPointValue: inputCGPointValue)
        
        dropPinOnMap()
        
        completion(true)
        
    }
    
    func onlyMePinDropButtonBackgroundProcessInitiate() {
        
        startAnimateForOnlyMePinDropProcess(inputCGPointValue: self.buttonPinDropMain.center) { (result) in
            
            if result {
                
                self.buttonPinDropMain.setImage(self.buttonPinDropOnlyMe.currentImage, for: .normal)
                
                doTheAnimationForConfirmationButtons()
                
            }
            
        }
        
    }
    
    /*
     functions for all friend pin drop buttons
     */
    func startAnimateForSpecialFriendPinDropProcess(inputCGPointValue: CGPoint, completion: (_ result: Bool) -> Void) {
        
        pinDropObjects.pinButtonSpecialPersonOrGroupClicked = true
        
        hideSpecificPinDropButtonsBehindMainButton(inputCGPointValue: inputCGPointValue)
        
        dropPinOnMap()
        
        completion(true)
        
    }
    
    func specialPersonPinDropButtonBackgroundProcessInitiate() {
        
        startAnimateForSpecialFriendPinDropProcess(inputCGPointValue: self.buttonPinDropMain.center) { (result) in
            
            if result {
                
                self.buttonPinDropMain.setImage(self.buttonPinDropSpecialFriends.currentImage, for: .normal)
                
                doTheAnimationForConfirmationButtons()
                
            }
            
        }
        
    }
    
    func hideSpecificPinDropButtonsBehindMainButton(inputCGPointValue : CGPoint) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonPinDropAllFriends.center = inputCGPointValue
            self.buttonPinDropOnlyMe.center = inputCGPointValue
            self.buttonPinDropSpecialFriends.center = inputCGPointValue
            
        }
        
    }
    
    func doTheAnimationForConfirmationButtons() {
        
        print("doTheAnimationForConfirmationButtons starts")
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonSavePinData.center = self.pinDropObjects.pinButtonConfirm
            self.buttonDeletePindData.center = self.pinDropObjects.pinButtonDelete
            
        }
        
    }
    
    func resetDropPinCenter(inputCGPointValue: CGPoint) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonPinDropAllFriends.center = inputCGPointValue
            self.buttonPinDropSpecialFriends.center = inputCGPointValue
            self.buttonPinDropOnlyMe.center = inputCGPointValue
            self.buttonDeletePindData.center = inputCGPointValue
            self.buttonSavePinData.center = inputCGPointValue
            
        }
        
        
    }
    
    func setImageFromCacheToButtonOnlyMe(inputUrl : String) {
    
        print("setImageFromCacheToButtonOnlyMe starts")
        
        if let image = cachedProfilePicture.object(forKey: inputUrl as NSString) {
            
            print("cache ten profile dataasını okuyabildik")
            
            self.buttonPinDropOnlyMe.setImage(image, for: .normal)
            
        }
        
    }
    
}

extension UIButton {
    
    func setProfilePictureToButton(_ urlString: String) {
        
        if let yarro = imageView {
            
            print("setProfilePictureToButton starts")
            print("urlString : \(urlString)")
            
            yarro.image = nil
            
            if let tempImage = cachedProfilePicture.object(forKey: urlString as NSString) {
                
                print("erku1")
                print("image : \(tempImage)")
                print("image : \(tempImage.size)")
                
                yarro.image = tempImage
                
                self.imageView?.image = tempImage
                
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
                                    
                                    yarro.image = image
                                    
                                })
                            }
                        }
                    })
                    
                    task.resume()
                }
            }
            
        }
        
        
    }
    
}




