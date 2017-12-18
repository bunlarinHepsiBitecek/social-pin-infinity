//
//  ParseLocationData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 16.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

extension WelcomeFirstPinViewController {
    
    func setParsedLocationData(inputPlaceMark : CLPlacemark) {
        
        print("getLocationDataParsed starts")
        
        self.user.userLocationObject.setUserID(inputUserID: user.userID)
        
        let tempString = NSUUID().uuidString
        
        self.user.userLocationObject.setLocationId(inputLocationId: tempString)
        
        print("LocationID : \(self.user.userLocationObject.locationId)")
        
        if let postalCode = inputPlaceMark.postalCode {
            self.user.userLocationObject.setPostalCode(inputPostalCode: postalCode)
        }

        if let countryCode = inputPlaceMark.isoCountryCode {
            print("countryCode : \(countryCode)")
            self.user.userLocationObject.setCountryCode(inputCountryCode: countryCode)
        }
    
        if let countryName = inputPlaceMark.country {
            print("countryName : \(countryName)")
            self.user.userLocationObject.setCountryName(inputCountryName: countryName)
        }
        
        if let thorough = inputPlaceMark.thoroughfare {
            print("thorough : \(thorough)")
            self.user.userLocationObject.setThorough(inputThorough: thorough)
        }
        
        if let subThorough = inputPlaceMark.subThoroughfare {
            print("subThorough : \(subThorough)")
            self.user.userLocationObject.setSubThorough(inputSubThorough: subThorough)
        }
        
        if let locationObj = inputPlaceMark.location as CLLocation? {
            
            if let locationData = locationObj.coordinate as CLLocationCoordinate2D? {
                
                if let locationLatitude = locationData.latitude as CLLocationDegrees? {
                    
                    self.user.userLocationObject.setLatitude(inputLatitude: Double(locationLatitude))
                    
                }
                
                if let locationLongitude = locationData.longitude as CLLocationDegrees? {
                    
                    self.user.userLocationObject.setLongitude(inputLongitude: locationLongitude)
                    
                }
                
            }
            
        }
        
        // timestamp set edilmedi henüz
        
        self.user.userLocationObject.getUserJSONObject()
        
        print("LocationID : \(self.user.userLocationObject.locationId)")
        
        let newUserLocation = UserLocation()
        
        newUserLocation.setUserID(inputUserID: user.userID)
        newUserLocation.setUserLocationID(inputUserLocationID: self.user.userLocationObject.locationId)
        
        newUserLocation.getUserJSONObject()
        
        print("LocationID : \(newUserLocation.userLocationID)")
        
        DatabaseLocation.ds.createFirbaseDatabaseLocation(locationID: self.user.userLocationObject.locationId, locationData: self.user.userLocationObject.locationDictionary)
        //DatabaseUserLocation.ds.createFirbaseDatabaseUserLocation(userID: self.user.userID, userLocationData: newUserLocation.userLocationDictionary)
    
        DatabaseUserLocation.ds.createFirbaseDatabaseUserLocation(userID: self.user.userID, userLocationData: newUserLocation.userLocationDictionary)
        
    }
    
}
