//
//  PinAnnotationProcess.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 14.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

extension PinDropViewController {
    
    func dropPinOnMap() {
        
        checkPinDataUploadedToDatabase()
        
        if !pinDataObject.isPinDropped {
            
            addPinAnnotation(for: pinDataObject.location.currenLocation)
            
            pinDataObject.isPinDropped(inputBooleanValue: true)
            
        }
        
    }
    
    func setSelectedImageToButton() {
        
        for annotation in self.mapViewObject.annotations as [MKAnnotation] {
            print("setSelectedImageToButton tüm annotationlar alınır: \(self.mapViewObject.annotations.count)")
            if let currentAnnotation = self.mapViewObject.view(for: annotation) as? PersonAnnotationView {
                print("Current displayed annotation bulduk")
                
                if pinDataObject.isPictureExist {
                    
                    print("point1")
                    
                    if let newImage = self.pinDataObject.pictureOnPin as UIImage? {
                        currentAnnotation.customCalloutView?.addImageButton.setImage(newImage, for: .normal)
                    }
                    
                } else {
                    
                    print("point2")
                    
                    currentAnnotation.customCalloutView?.addImageButton.setImagesToButton(inputImageNameString: ConstantDefaultImages.MapAnnotation.PHOTO_CAMERA_IMAGE)
                    
                }
            }
        }
    }
    
    func setCaptureImageOfTextFieldOnButton() {
        
        print("setCaptureImageOfTextFieldOnButton starts")
        print("text : \(self.pinDataObject.textOnPin)")
        
        for annotation in self.mapViewObject.annotations as [MKAnnotation] {
            
            if let currentAnnotation = self.mapViewObject.view(for: annotation) as? PersonAnnotationView {
                
                if self.pinDataObject.isCapturedTextExist {
                    
                    if let newImage = self.pinDataObject.textCaptureImage as UIImage? {
                        
                        currentAnnotation.customCalloutView?.addTextButton.setImage(newImage, for: .normal)
                        
                    }
                    
                } else {
                    
                    print("point2")
                    
                    currentAnnotation.customCalloutView?.addTextButton.setImagesToButton(inputImageNameString: ConstantDefaultImages.MapAnnotation.TEXT_MATERIAL_IMAGE)
                    
                }
            }
        }
        
    }
    
    func setSelectedVideoImageToButton() {
        
        for annotation in self.mapViewObject.annotations as [MKAnnotation] {
            
            if let currentAnnotation = self.mapViewObject.view(for: annotation) as? PersonAnnotationView {
                
                if self.pinDataObject.videoExistFlag {
                    
                    if let newImage = self.pinDataObject.videoCapture as UIImage? {
                        
                        currentAnnotation.customCalloutView?.addVideoButton.setImage(newImage, for: .normal)
                        
                    }
                    
                } else {
                    
                    currentAnnotation.customCalloutView?.addVideoButton.setImagesToButton(inputImageNameString: ConstantDefaultImages.MapAnnotation.PLAY_VIDEO_IMAGE)
                    
                }
                
            }
        }
        
    }
    
    // add pin annotation on the map with image, video and text data
    func addPinAnnotation(for coordinate: CLLocationCoordinate2D) {
        
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        geocoderObject.reverseGeocodeLocation(location) { placemarks, error in
            
            if let placemark = placemarks?.first {
                
                self.annotation = PersonAnnotation(inputPinData: self.pinDataObject)
                //self.setParsedLocationData(inputPlaceMark: placemark)
                
                self.mapViewObject.addAnnotation(self.annotation)
                
                
                
                //self.mapView.selectedAnnotations.append(self.annotation)
                
                self.mapViewObject.selectAnnotation(self.annotation, animated: true)
            }
        }
    }
    
    func addImageRequestForPersonProcessInitiate() {
        
        if pinDataObject.isPictureExist {
            
            if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.WelcomeFirstPin, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PinDataPictureViewController_storyBoardID) as? PinDataPictureViewController {
                
                destinationViewController.pinDataObject = self.pinDataObject
                destinationViewController.tempMapView = self.mapViewObject
                destinationViewController.callerView = ViewControllerEnums.PinDrop
                
                present(destinationViewController, animated: true, completion: {
                    print("gidiyoruz :)")
                })
                
            }
            
        } else {
            
            self.decideHowProfilePictureLoads()
        }
        
    }
    
    func addVideoRequestForPersonProcessInitiate() {
        
        if self.pinDataObject.videoExistFlag {
            
            self.startGettingVideoProcess()
            
        } else {
            
            self.informationForVideoData()
            
        }
        
    }
    
    func addTextRequestForPersonProcessInitiate() {
        
        print("addTextRequestForPerson starts")
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.WelcomeFirstPin, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PinTextDataViewController_storyBoardID) as? PinTextDataViewController {
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.tempMapView = self.mapViewObject
            destinationViewController.callerView = ViewControllerEnums.PinDrop
            
            present(destinationViewController, animated: true, completion: {
                print("gidiyoruz :)")
            })
        }
        
    }
    
    func pinDataSaveProcessInitiate() {
        
        self.savePinDataToFirebase()
        //hideSelectedDropPinButton()
        showAlert()
        
    }
    
    func deletePinDataProcessInitiate() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton(ConstantStrings.ButtonTitles.STRING_OK) {
            
            self.mapViewObject.removeAnnotation(self.mapViewObject.selectedAnnotations.last!)
            
            self.pinDataObject.resetPinDataFlags()
            self.pinDropObjects.resetClickedInfo()
            
            self.resetDropPinCenter(inputCGPointValue: self.buttonPinDropMain.center)
            
            self.mainPinDropButtonClicked = false
            
            self.buttonPinDropMain.setImage(UIImage(named: ConstantDefaultImages.MapAnnotation.MAIN_DROP_PIN_BUTTON_IMAGE), for: .normal)
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_DATA_ON_PIN_GET_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
    }
    
}
