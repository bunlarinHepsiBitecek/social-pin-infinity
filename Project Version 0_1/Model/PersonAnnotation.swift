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
    var person: User
    var coordinate: CLLocationCoordinate2D { return person.userLocationObject.currenLocation }
    
    init(person: User) {
        self.person = person
        super.init()
    }
    
    var title: String? {
        return person.username
    }
    
    var subtitle: String? {
        return person.userNameSurname
    }
    
}
