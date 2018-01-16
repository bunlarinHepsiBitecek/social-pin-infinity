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
        
        //self.pinDataObject.location.setUserID(inputUserID: user.userID)
        self.pinDataObject.location.userID = user.userID
        
        //let tempString = NSUUID().uuidString
        //self.pinDataObject.location.setLocationId(inputLocationId: tempString)
        
        if let postalCode = inputPlaceMark.postalCode {
            //self.pinDataObject.location.setPostalCode(inputPostalCode: postalCode)
            self.pinDataObject.location.postalCode = postalCode
        }

        if let countryCode = inputPlaceMark.isoCountryCode {
            print("countryCode : \(countryCode)")
            //self.pinDataObject.location.setCountryCode(inputCountryCode: countryCode)
            self.pinDataObject.location.countryCode = countryCode
        }
    
        if let countryName = inputPlaceMark.country {
            print("countryName : \(countryName)")
            //self.pinDataObject.location.setCountryName(inputCountryName: countryName)
            self.pinDataObject.location.countryName = countryName
        }
        
        if let thorough = inputPlaceMark.thoroughfare {
            print("thorough : \(thorough)")
            //self.pinDataObject.location.setThorough(inputThorough: thorough)
            self.pinDataObject.location.thorough = thorough
        }
        
        if let subThorough = inputPlaceMark.subThoroughfare {
            print("subThorough : \(subThorough)")
            //self.pinDataObject.location.setSubThorough(inputSubThorough: subThorough)
            self.pinDataObject.location.subThorough = subThorough
        }
        
        if let locationObj = inputPlaceMark.location as CLLocation? {
            
            if let locationData = locationObj.coordinate as CLLocationCoordinate2D? {
                
                if let locationLatitude = locationData.latitude as CLLocationDegrees? {
                    
                    //self.pinDataObject.location.setLatitude(inputLatitude: locationLatitude)
                    self.pinDataObject.location.latitude = locationLatitude
                    
                }
                
                if let locationLongitude = locationData.longitude as CLLocationDegrees? {
                    
                    //self.pinDataObject.location.setLongitude(inputLongitude: locationLongitude)
                    self.pinDataObject.location.longitude = locationLongitude
                    
                    
                }
                
            }
            
        }
        
    }
    
}
