//
//  Location.swift
//  Project Version 0_1
//
//  Created by Remzi on 16/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class Location {
    
    private var _locationId: String {
        return NSUUID().uuidString
    }
    
    private var _currentLocation: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid
    private var _isPinDropped: Bool
    
    init() {
        self._isPinDropped = false
    }
    
    var locationId: String {
        return self._locationId
    }
    
    var currenLocation: CLLocationCoordinate2D {
        return self._currentLocation
    }
    
    var isPinDropped: Bool {
        return self._isPinDropped
    }
    
    func setIsPinDropped(isPinDropped: Bool) {
        self._isPinDropped = isPinDropped
    }
    
    func setCurrentLocation(locationCoordinate: CLLocationCoordinate2D) {
        self._currentLocation = locationCoordinate
    }
    
    
    func toPrint() {
        print("Location id: \(locationId)")
        print("Current Location: \(currenLocation)")
        print("Location isPinDropped: \(isPinDropped)")
    }
    
}
