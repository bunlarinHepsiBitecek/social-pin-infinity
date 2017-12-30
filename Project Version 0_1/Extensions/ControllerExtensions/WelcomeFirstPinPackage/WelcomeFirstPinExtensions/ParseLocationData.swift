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
        
        self.pinDataObject.location.setUserID(inputUserID: user.userID)
        
        //let tempString = NSUUID().uuidString
        //self.pinDataObject.location.setLocationId(inputLocationId: tempString)
        
        if let postalCode = inputPlaceMark.postalCode {
            self.pinDataObject.location.setPostalCode(inputPostalCode: postalCode)
        }

        if let countryCode = inputPlaceMark.isoCountryCode {
            print("countryCode : \(countryCode)")
            self.pinDataObject.location.setCountryCode(inputCountryCode: countryCode)
        }
    
        if let countryName = inputPlaceMark.country {
            print("countryName : \(countryName)")
            self.pinDataObject.location.setCountryName(inputCountryName: countryName)
        }
        
        if let thorough = inputPlaceMark.thoroughfare {
            print("thorough : \(thorough)")
            self.pinDataObject.location.setThorough(inputThorough: thorough)
        }
        
        if let subThorough = inputPlaceMark.subThoroughfare {
            print("subThorough : \(subThorough)")
            self.pinDataObject.location.setSubThorough(inputSubThorough: subThorough)
        }
        
        if let locationObj = inputPlaceMark.location as CLLocation? {
            
            if let locationData = locationObj.coordinate as CLLocationCoordinate2D? {
                
                if let locationLatitude = locationData.latitude as CLLocationDegrees? {
                    
                    self.pinDataObject.location.setLatitude(inputLatitude: Double(locationLatitude))
                    
                }
                
                if let locationLongitude = locationData.longitude as CLLocationDegrees? {
                    
                    self.pinDataObject.location.setLongitude(inputLongitude: locationLongitude)
                    
                }
                
            }
            
        }
        
        // timestamp set edilmedi henüz
        
        /*
        print("LocationID : \(self.pinDataObject.location.locationId)")
        
        let newUserLocation = UserLocation()
        
        newUserLocation.setUserID(inputUserID: user.userID)
        newUserLocation.setUserLocationID(inputUserLocationID: self.pinDataObject.location.locationId)
        
        newUserLocation.getUserJSONObject()
        
        print("LocationID : \(newUserLocation.userLocationID)")
        
        DatabaseLocation.ds.createFirbaseDatabaseLocation(locationID: self.pinDataObject.location.locationId, locationData: self.pinDataObject.location.locationDictionary)
    
        DatabaseUserLocation.ds.createFirbaseDatabaseUserLocation(userID: self.user.userID, userLocationData: newUserLocation.userLocationDictionary)
 
         */
        
    }
    
}
