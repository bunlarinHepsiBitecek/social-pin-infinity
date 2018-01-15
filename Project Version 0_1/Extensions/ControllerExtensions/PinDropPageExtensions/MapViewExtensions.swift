//
//  MapViewExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 11.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

extension PinDropViewController {
    
    func setMapScaleView() {
        
        let scale = MKScaleView(mapView: mapViewObject)
        
        scale.scaleVisibility = .visible
        scale.frame.origin = CGPoint(x: 10, y: 70)
        view.addSubview(scale)
        
    }
    
    func setLocationManagerProperties() {
        
        locationManagerObject.delegate = self
        locationManagerObject.desiredAccuracy = kCLLocationAccuracyBest
        locationManagerObject.requestWhenInUseAuthorization()
        locationManagerObject.startUpdatingLocation()
        locationManagerObject.distanceFilter = ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.distanceFilterForLocationManager_1_meter
        
    }
    
    func setMapViewProperties() {
        
        mapViewObject.delegate = self
        mapViewObject.showsUserLocation = true
        mapViewObject.showsCompass = true
        mapViewObject.isRotateEnabled = true
        mapViewObject.isOpaque = true
        
    }
    
    func setTrackingButtonProperties() {
        
        let trackingButton = MKUserTrackingButton(mapView: mapViewObject)

        trackingButton.frame.origin = CGPoint(x: self.view.frame.width - 40, y: 80)
        
        self.view.addSubview(trackingButton)
        
    }
    
    func setTrackingModeProperties() {
        
        print("setTrackingModeProperties starts")
        
        self.mapViewObject.setUserTrackingMode(.followWithHeading, animated: true)
        
    }
    
    func getUserObject() {
        
        if let tabBarController = self.tabBarController as? HomePageViewController {
            
            self.user = tabBarController.user
        }
        
    }
    
}
