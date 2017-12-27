//
//  PersonAnnotation.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class PersonAnnotation: NSObject, MKAnnotation {
    
    var pinDataObject : PinData
    
    var coordinate: CLLocationCoordinate2D { return pinDataObject.location.currenLocation }
    
    init(inputPinData : PinData) {
        
        self.pinDataObject = inputPinData
        super.init()
    }
    
    override init() {
        
        self.pinDataObject = PinData()
        
    }
    
}

