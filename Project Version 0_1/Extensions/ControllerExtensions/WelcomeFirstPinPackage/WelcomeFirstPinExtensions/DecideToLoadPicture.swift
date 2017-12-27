//
//  DecideToLoadPicture.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 22.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

extension PinDataPictureViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func goToDecideHowProfilePictureLoads() {
        
        self.decideHowProfilePictureLoads()
        
    }
    
    @objc func getProfilePhoto() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func takeProfilePhoto() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print(info)
        
        var selectedImageFromPicker : UIImage?
        
        // downcast any to UIImage
        if let editedPickedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            
            print("check1")
            
            selectedImageFromPicker = editedPickedImage
            
        } else if let originalPickedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            print("check2")
            selectedImageFromPicker = originalPickedImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            print("check3")
            self.pinDataImage.image = selectedImage
            self.pinDataObject.setPictureOnPin(inputPictureOnPin: selectedImage)
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("photo picking is canceled")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //
    func decideHowProfilePictureLoads() {
        
        print("decideHowProfilPictureLoads starts")
        
        let profilePictureAlertController = UIAlertController(title: "Choose Profile Picture", message: nil, preferredStyle: .actionSheet)
        
        let cameraAlertAction = UIAlertAction(title: "Take a photo", style: .default) { (alertAction) in
            print(alertAction)
            // function to take a photo
            self.takeProfilePhoto()
        }
        
        let photoLibraryAlertAction = UIAlertAction(title: "Choose from library", style: .default) { (alertAction) in
            print(alertAction)
            self.getProfilePhoto()
        }
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
            print(alertAction)
        }
        
        profilePictureAlertController.addAction(cameraAlertAction)
        profilePictureAlertController.addAction(photoLibraryAlertAction)
        profilePictureAlertController.addAction(cancelAlertAction)
        
        self.present(profilePictureAlertController, animated: true, completion: nil)
        
    }
    
    /*
    func setSelectedImageToButton() {
        
        print("setSelectedImageToButton starts")
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
            print("setSelectedImageToButton tüm annotationlar alınır: \(self.mapView.annotations.count)")
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {
                print("Current displayed annotation bulduk")
                if let newImage = self.pinDataObject.pictureOnPin as UIImage? {
                    currentAnnotation.customCalloutView?.addImageButton.setImage(newImage, for: .normal)
                    //currentAnnotation.customCalloutView?.person.userLocationObject.setPinImage(pinImage: newImage)
                }
            }
        }
        
    }
 */
    
}
