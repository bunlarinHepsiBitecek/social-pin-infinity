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
        
        print("picker.videoMaximumDuration : \(picker.videoMaximumDuration)")
        
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
        picker.videoMaximumDuration = 20
        
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
            
            print("picker.videoMaximumDuration : \(picker.videoMaximumDuration)")
            
            if checkDurationTimeOfSelectedVideoFromLibrary(inputUrl: videoUrl as URL) {
                
                if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum((videoUrl.path)!))
                {
                    
                    UISaveVideoAtPathToSavedPhotosAlbum(videoUrl.path!, nil, nil, nil)
                    
                }
                
                getVideoSnapShotAsAnImage(url: videoUrl)
                //handleVideoSelectedProcess(url: videoUrl)
                dismissActionSheet()
                
            } else {
                
                picker.dismiss(animated: true, completion: {
                    print("picker is closed")
                })
                
            }
            
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
            
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            
            self.pinDataObject.setPictureOnPin(inputPictureOnPin: selectedImage)
            self.pinDataObject.isPictureExist(inputBooleanValue: true)
            self.setSelectedImageToButton()
            
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
        
        let videoAlertController = UIAlertController(title: ConstantsMediaProperties.VideoActionSheetConstants.stringValueVideoChoise, message: nil, preferredStyle: .actionSheet)
        
        let videoAlertActionChoiceExisting = UIAlertAction(title: ConstantsMediaProperties.VideoActionSheetConstants.stringValueVideoFromPhotoLibrary, style: .default) { (alertAction) in
            
            self.getVideoDataFromLibrary()
        }
        
        let videoAlertActionTakeVideo = UIAlertAction(title: ConstantsMediaProperties.VideoActionSheetConstants.stringValueVideoNewRecord, style: .default) { (alertAction) in
            
            self.takeVideoData()
        }
        
        let videoAlertActionPlayVideo = UIAlertAction(title: ConstantsMediaProperties.VideoActionSheetConstants.stringValueVideoPlay, style: .default) { (alertAction) in

            self.playVideo(url: self.pinDataObject.videoDataUrl as URL)
            
        }
        
        let videoAlertActionDeleteVideo = UIAlertAction(title: ConstantsMediaProperties.VideoActionSheetConstants.stringValueVideoDelete, style: .destructive) { (alertAction) in
            
            self.deleteVideoProcess()
        }
        
        
        let cancelAlertAction = UIAlertAction(title: ConstantsMediaProperties.VideoActionSheetConstants.stringValueActionSheetCancelButtonTitle, style: .cancel) { (alertAction) in
            print(alertAction)
        }
        
        videoAlertController.addAction(videoAlertActionChoiceExisting)
        videoAlertController.addAction(videoAlertActionTakeVideo)
        
        if self.pinDataObject.videoExistFlag {
            videoAlertController.addAction(videoAlertActionPlayVideo)
            videoAlertController.addAction(videoAlertActionDeleteVideo)
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
    
    func checkDurationTimeOfSelectedVideoFromLibrary(inputUrl : URL) -> Bool {
        
        let avlUrlAsset = AVURLAsset(url: inputUrl as URL)
        
        let durationTime : CMTime = avlUrlAsset.duration
        
        let durationSecondValue = CMTimeGetSeconds(durationTime)
        
        if durationSecondValue > ConstantsMediaProperties.VideoProperties.selectedVideoDurationLimit {
            
            createAlertForGreaterSizeVideos()
            return false
            
        } else {
            
            return true
            
        }
        
    }
    
    func createAlertForGreaterSizeVideos() {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_SELECTED_VIDEO_SIZE_TOO_BIG, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL).setDismissBlock {
            
            print("ok anladık değiştiricez")
            //self.dismissActionSheet()
            
        }
        
    }
    
    func informationForVideoData() {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showInfo(ConstantStrings.AlertInfoHeaders.STRING_INFO, subTitle: ConstantStrings.InfoSentences.STRING_INFO_VIDEO_LIMIT, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_OK).setDismissBlock {
            
            self.startGettingVideoProcess()
            
        }
        
    }
    
    func deleteVideoProcess() {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton(ConstantsMediaProperties.VideoActionSheetAlertButtonTitles.stringValueVideoDeletedConfirmButtonTitle) {
            
            self.pinDataObject.setVideoExistFlag(inputVideoExistFlag: false)
            self.setSelectedVideoImageToButton()
        }
        
        alertView.showWarning(ConstantsMediaProperties.VideoActionSheetWarningTitles.stringValueVideoDeletedAlertTitle, subTitle: ConstantsMediaProperties.VideoActionSheetWarningSentencesConstants.stringValueVideoGetDeleted, closeButtonTitle: ConstantsMediaProperties.VideoActionSheetAlertButtonTitles.stringValueVideoDeletedCancelButtonTitle)
        
    }
    
    
    
}

