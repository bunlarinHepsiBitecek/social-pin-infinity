//
//  SelectedAnnotationOperation.swift
//  Project Version 0_1
//
//  Created by Remzi on 30/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import MapKit

extension WelcomeFirstPinViewController {
    
    func setSelectedImageToButton() {
        
        print("setSelectedImageToButton starts")
        print("pinDataObject.isPictureExist : \(pinDataObject.isPictureExist)")
        
        //let image = UIImage(named: "image1.png")
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
            print("setSelectedImageToButton tüm annotationlar alınır: \(self.mapView.annotations.count)")
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {
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
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
            
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {
                
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
        
        for annotation in self.mapView.annotations as [MKAnnotation] {
            
            if let currentAnnotation = self.mapView.view(for: annotation) as? PersonAnnotationView {
                
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
}
