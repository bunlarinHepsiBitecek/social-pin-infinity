//
//  DecideToLoadVideo.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 23.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import AVKit

import Firebase
import MapKit

extension WelcomeFirstPinViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func goToDecideHowProfilePictureLoads() {
        
        self.decideHowProfilePictureLoads()
        
    }
    
    /*
        the function below gets video from current library
     */
    @objc func getVideoDataFromLibrary() {
        
        print("getVideoDataFromLibrary starts")
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.mediaTypes = [kUTTypeMovie as String
                            ,kUTTypeVideo as String
                            ,kUTTypeGIF   as String]
        self.present(picker, animated: true, completion: nil)
        
    }
    
    
    /*
     the function below records a new video
     */
    @objc func takeVideoData() {
        
        print("getVideoDataFromLibrary starts")
        
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.camera
        picker.mediaTypes = [kUTTypeMovie as String
                            ,kUTTypeVideo as String
                            ,kUTTypeGIF   as String]
        picker.allowsEditing = false
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
        
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
    
    /*
        the function below handles where to get video data and where to set
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print(info)
        
        print("imagePickerController starts")
        
        if let videoUrl = info[UIImagePickerControllerMediaURL] as? NSURL {
            
            print("videoUrl : \(videoUrl)")
            
            getVideoSnapShotAsAnImage(url: videoUrl)
            
            handleVideoSelectedProcess(url: videoUrl)
            
            dismissActionSheet()
        }
        
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
            //self.pinDataImage.image = selectedImage
            self.pinDataObject.setPictureOnPin(inputPictureOnPin: selectedImage)
            self.pinDataObject.isPictureExist(inputBooleanValue: true)
            setSelectedImageToButton()
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    func dismissActionSheet() {
        
        self.dismiss(animated: true, completion: {
            print("ActionSheet is dismissed")
        })
        
    }
    
    
    /* the function below save video to firebase storage and then get it's download url address and set it to pindataobject
       to save database as an item
     */
    func handleVideoSelectedProcess(url : NSURL) {
        
        let videoDataName = "erkut-deneme.mov"
        
        let task = Storage.storage().reference().child("Users").child("Locations").child(videoDataName).putFile(from: url as URL, metadata: nil) { (data, error) in
            
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    
                    print("errorMessage : \(errorMessage.userInfo)")
                    print("errorMessage : \(errorMessage.localizedDescription)")
                    
                }
                
            } else {
                
                if let storageUrl = data?.downloadURL()?.absoluteString {
                    
                    print("storageUrl : \(storageUrl)")
                    
                    self.setVideoDownloadUrlAddress(inputDownloadUrlString: storageUrl)

                }
                
            }
            
        }
        
        task.observe(.progress) { (snapShot) in
            
            print("snapShot : \(snapShot.progress?.completedUnitCount)")
            
        }
        
    }
    
    func setVideoDownloadUrlAddress(inputDownloadUrlString : String) {
        
        pinDataObject.setVideoDataUrl(inputVideoDataUrl: URL(string: inputDownloadUrlString) as! NSURL)
        
    }
    
    /*
        the function below gets a screen shot of the video to present it previous view on the play video button
     */
    func getVideoSnapShotAsAnImage(url : NSURL) {
        
        print("getVideoSnapShotAsAnImage starts")
        
        let vidUrl = url
        let asset = AVURLAsset(url: vidUrl as URL)
        let generator = AVAssetImageGenerator(asset: asset)
        
        generator.appliesPreferredTrackTransform = true
        
        let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
        
        print("check1")
        
        self.pinDataObject.setVideoExistFlag(inputVideoExistFlag: true)
        self.pinDataObject.setVideoDataUrl(inputVideoDataUrl: vidUrl)
        
        print("check2")
        
        do {
            
            print("check3")
            let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
            
            self.pinDataObject.setVideoCapture(inputCapturedImage: UIImage(cgImage: imageRef))
            
            setSelectedVideoImageToButton()
            
            
        } catch {
            print("image generation is failed")
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("photo picking is canceled")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func startGettingVideoProcess() {
        
        let videoAlertController = UIAlertController(title: CONSTANT_STRING_VIDEO_CHOISE, message: nil, preferredStyle: .actionSheet)
        
        let videoAlertActionChoiceExisting = UIAlertAction(title: CONSTANT_STRING_VIDEO_FROM_PHOTO_LIBRARY, style: .default) { (alertAction) in
            print(alertAction)
            // function to take a photo
            self.getVideoDataFromLibrary()
        }
        
        let videoAlertActionTakeVideo = UIAlertAction(title: CONSTANT_STRING_VIDEO_NEW_RECORD, style: .default) { (alertAction) in
            print(alertAction)
            // function to take a photo
            self.takeVideoData()
        }
        
        let videoAlertActionPlayVideo = UIAlertAction(title: CONSTANT_STRING_VIDEO_PLAY, style: .default) { (alertAction) in
            print(alertAction)
            // function to take a photo
            self.playVideo(url: self.pinDataObject.videoDataUrl as URL)
            
        }
        
        let cancelAlertAction = UIAlertAction(title: CONSTANT_STRING_VIDEO_CANCEL, style: .cancel) { (alertAction) in
            print(alertAction)
        }
        
        videoAlertController.addAction(videoAlertActionChoiceExisting)
        videoAlertController.addAction(videoAlertActionTakeVideo)
        
        if self.pinDataObject.videoExistFlag {
            videoAlertController.addAction(videoAlertActionPlayVideo)
        }
        
        videoAlertController.addAction(cancelAlertAction)
        
        self.present(videoAlertController, animated: true, completion: nil)
        
        
    }
    
    func playVideo(url : URL) {
        
        print("playVideo starts")
        
        print("url : \(url)")
        
        let video = AVPlayer(url: url)
        let videoPlayer = AVPlayerViewController()
        
        videoPlayer.player = video
        
        present(videoPlayer, animated: true, completion: {
            
            video.play()
            
        })
        
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
    
    func tata() {
        print("aha yakaladık")
        
        let image = UIImage(named: "image1.png")
        
        self.yarroAnno.customCalloutView?.addImageButton.setImage(image, for: .normal)
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
            print("loop1")
        }
        
    }
    
    func setSelectedImageToButton() {
        
        print("setSelectedImageToButton starts")
        
        //let image = UIImage(named: "image1.png")
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
            print("setSelectedImageToButton tüm annotationlar alınır: \(self.mapView.annotations.count)")
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {
                print("Current displayed annotation bulduk")
                
                if pinDataObject.isPictureExist {
                    
                    if let newImage = self.pinDataObject.pictureOnPin as UIImage? {
                        currentAnnotation.customCalloutView?.addImageButton.setImage(newImage, for: .normal)
                    }
                    
                } else {
                    
                    currentAnnotation.customCalloutView?.addImageButton.setImagesToButton(inputImageNameString: ConstantDefaultImages.MapAnnotation.PHOTO_CAMERA_IMAGE)
                    
                }
                
                
                
            }
        }
        
    }
    
    func setSelectedVideoImageToButton() {
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
           
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {

                if self.pinDataObject.videoExistFlag {
                    
                    if let newImage = self.pinDataObject.videoCapture as UIImage? {
                        
                        currentAnnotation.customCalloutView?.addVideoButton.setImage(newImage, for: .normal)
                        
                    }
                    
                }
                
            }
        }
        
    }
    
}

