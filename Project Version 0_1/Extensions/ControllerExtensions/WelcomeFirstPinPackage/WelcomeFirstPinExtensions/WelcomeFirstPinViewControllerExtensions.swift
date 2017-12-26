//
//  WelcomeFirstPinViewControllerExtensions.swift
//  Project Version 0_1
//
//  Created by Remzi on 23/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

extension WelcomeFirstPinViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //
    func askGetPicture() {
        
        print("askGetPicture starts")
        
        let profilePictureAlertController = UIAlertController(title: "Choose Profile Picture", message: nil, preferredStyle: .actionSheet)
        
        let cameraAlertAction = UIAlertAction(title: "Take a photo", style: .default) { (alertAction) in
            print(alertAction)
            // function to take a photo
            self.takePhoto()
        }
        
        let photoLibraryAlertAction = UIAlertAction(title: "Choose from library", style: .default) { (alertAction) in
            print(alertAction)
            self.getFromLibraryPhoto()
        }
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
            print(alertAction)
        }
        
        profilePictureAlertController.addAction(cameraAlertAction)
        profilePictureAlertController.addAction(photoLibraryAlertAction)
        profilePictureAlertController.addAction(cancelAlertAction)
        
        self.present(profilePictureAlertController, animated: true, completion: nil)
        
    }
    
    @objc func getFromLibraryPhoto() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func takePhoto() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("print info: \(info)")
        
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
            self.imageView.image = selectedImage
            self.dismiss(animated: true, completion: nil)
            
            setSelectedImageToButton()
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("photo picking is canceled")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setSelectedImageToButton() {
        for annotation in self.mapView.annotations as [MKAnnotation] {
            print("setSelectedImageToButton tüm annotationlar alınır: \(self.mapView.annotations.count)")
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {
                print("Current displayed annotation bulduk")
                if let newImage = self.imageView.image {
                    currentAnnotation.customCalloutView?.addImageButton.setImage(newImage, for: .normal)
                    currentAnnotation.customCalloutView?.person.userLocationObject.setPinImage(pinImage: newImage)
                }
            }
        }
        
    }
}
