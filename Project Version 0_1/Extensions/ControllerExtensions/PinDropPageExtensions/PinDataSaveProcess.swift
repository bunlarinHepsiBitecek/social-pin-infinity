//
//  PinDataSaveProcess.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 15.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase

extension PinDropViewController {
    
    func savePinDataToFirebase() {
        
        print("savePinData func is activated")
        loadVideoToStorage()
        loadPinImageToStorage()
        loadTextImageToStorage()
        createPinToFirebase()
    }
    
    
    /* the function below save video to firebase storage and then get it's download url address and set it to pindataobject
     to save database as an item
     */
    func loadVideoToStorage() {
        guard self.pinDataObject.videoExistFlag else {
            print("Remzi: Video yok return")
            return
        }
        
        let videoID = NSUUID().uuidString
        
        let task = Storage.storage().reference().child(FirebaseModels.Users.CHILD_USERS).child(FirebaseModels.Locations.CHILD_LOCATIONS).child("\(videoID).mov").putFile(from: self.pinDataObject.videoDataUrl as URL, metadata: nil) { (metadata, error) in
            
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    print("video firebase load Hata oluştu")
                    print("errorMessage : \(errorMessage.userInfo)")
                    print("errorMessage : \(errorMessage.localizedDescription)")
                }
                
            } else {
                
                if let storageUrl = (metadata?.downloadURL() as NSURL?) {
                    
                    print("Yükleme başarılı video storageUrl : \(storageUrl)")
                    
                    self.pinDataObject.setVideoIDOnPin(inputVideoIDOnPin: videoID)
                    self.pinDataObject.setVideoDataUrlFirebase(inputVideoDataUrlFirebase: storageUrl)
                    self.pinDataObject.setPinDataUploadedDatabase(inputBooleanValue: true)
                    self.updatePinItem(key: FirebaseModelConstants.PinItem.videoURL, value: storageUrl.absoluteString!)
                }
            }
            
        }
        
        task.observe(.progress) { (snapShot) in
            print("snapShot : \(snapShot.progress?.completedUnitCount)")
        }
        
        task.observe(.success) { (snapShot) in
            print("firebase video yükleme tamamlandı")
        }
        
    }
    
    /* Load pin image to firebase*/
    func loadPinImageToStorage() {
        guard self.pinDataObject.isPictureExist else {
            print("Remzi: Pin image yok return")
            return
        }
        
        let imageID = NSUUID().uuidString
        
        let storageReference = Storage.storage().reference().child(FirebaseStorageConstants.Users).child(FirebaseModels.Locations.CHILD_LOCATIONS).child("\(imageID).png")
        
        if let uploadData = UIImagePNGRepresentation(self.pinDataObject.pictureOnPin) {
            
            storageReference.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                
                if error != nil {
                    
                    if let errorMessage = error as NSError? {
                        
                        print("loadPinImageToStorage error")
                        print("errorMessage : \(errorMessage.localizedDescription)")
                        print("errorMessage : \(errorMessage.userInfo)")
                    }
                } else {
                    
                    if let storageUrl = (metadata?.downloadURL() as NSURL?) {
                        print("Yükleme başarılı image storageUrl : \(storageUrl)")
                        
                        self.pinDataObject.setPictureIDOnPin(inputPictureIDOnPin: imageID)
                        self.pinDataObject.setPictureOnPinUrl(inputPictureUrl: storageUrl)
                        self.pinDataObject.setPinDataUploadedDatabase(inputBooleanValue: true)
                        self.updatePinItem(key: FirebaseModelConstants.PinItem.pictureURL, value: storageUrl.absoluteString!)
                    }
                }
            })
        }
    }
    
    /* Load Text Capture image to firebase*/
    func loadTextImageToStorage() {
        guard self.pinDataObject.isCapturedTextExist else {
            print("Remzi: text image yok return")
            return
        }
        
        let imageID = NSUUID().uuidString
        
        let storageReference = Storage.storage().reference().child(FirebaseStorageConstants.Users).child(FirebaseModels.Locations.CHILD_LOCATIONS).child("\(imageID).png")
        
        if let uploadData = UIImagePNGRepresentation(self.pinDataObject.textCaptureImage) {
            
            storageReference.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                
                if error != nil {
                    
                    if let errorMessage = error as NSError? {
                        print("loadTextImageToStorage error")
                        print("errorMessage : \(errorMessage.localizedDescription)")
                        print("errorMessage : \(errorMessage.userInfo)")
                    }
                } else {
                    
                    if let storageUrl = (metadata?.downloadURL() as NSURL?) {
                        print("Yükleme başarılı image storageUrl : \(storageUrl)")
                        
                        self.pinDataObject.setTextCaptureIDOnPin(inputTextCaptureIDOnPin: imageID)
                        self.pinDataObject.setTextCaptureURLOnPin(inputTextCaptureURL: storageUrl)
                        self.pinDataObject.setPinDataUploadedDatabase(inputBooleanValue: true)
                        self.updatePinItem(key: FirebaseModelConstants.PinItem.textURL, value: storageUrl.absoluteString!)
                    }
                }
            })
        }
    }
    
    func createPinToFirebase() {
        let locationID = NSUUID().uuidString
        self.pinDataObject.location.locationId = locationID
        
        createUserLocationInstance()
        createLocationInstance()
        createPinItemInstance()
        
        self.pinDataObject.setPinDataUploadedDatabase(inputBooleanValue: true)
    }
    
    func createUserLocationInstance() {
        let userLocation = UserLocation()
        userLocation.userID = self.user.userID
        userLocation.userLocationID = self.pinDataObject.location.locationId
        
        DatabaseUserLocation.ds.createFirbaseDatabaseUserLocation(userID: self.user.userID, userLocationData: userLocation.getJSONObject())
    }
    
    func createLocationInstance() {
        DatabaseLocation.ds.createFirbaseDatabaseLocation(locationID: self.pinDataObject.location.locationId, locationData: self.pinDataObject.location.getJSONObject())
    }
    
    // create pin items when picture, video or textCapture exists
    func createPinItemInstance() {
        if self.pinDataObject.videoExistFlag || self.pinDataObject.isPictureExist || self.pinDataObject.isCapturedTextExist {
            DatabasePinItem.ds.createFirbaseDatabasePinItem(userID: self.user.userID, locationID: self.pinDataObject.location.locationId, pinItemData: self.pinDataObject.getJSONObject())
        }
    }
    
    func updatePinItem(key: String, value: String) {
        DatabasePinItem.ds.updateFirbaseDatabasePinItem(userID: self.user.userID, locationID: self.pinDataObject.location.locationId, keyName: key, keyValue: value)
    }
    
    
    func showAlert() {
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
            print("Aksiyon bile alıyor")
            
        }
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: true,
            contentViewCornerRadius : 20
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess(Constants.WelcomeFirstPin.Success, subTitle: Constants.WelcomeFirstPin.Message, closeButtonTitle: Constants.WelcomeFirstPin.Dismiss,  timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 10.0, timeoutAction:timeoutAction)).setDismissBlock {
            
            print("Home page gidiyoruz!")
            //self.gotoHomePage()
            
        }
    }
    
    func gotoHomePage() {
        
        if let destinationViewController = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "HomePage_referenceID") as? HomePageViewController {
            
            destinationViewController.user = self.user
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
}
