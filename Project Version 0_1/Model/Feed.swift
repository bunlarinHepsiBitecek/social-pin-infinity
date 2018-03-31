//
//  Feed.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class Feed {
    
    private var _rowCount: Int
    private var _location: Location
    private var _ownerUser: User
    private var _timestamp: Double
    private var _customViews: [CustomView]
    private var _selectedIndex: Int
    
    init() {
        self._rowCount = 1
        self._location = Location()
        self._ownerUser = User()
        self._timestamp = DEFAULT_DOUBLE_VALUE
        self._customViews = []
        self._selectedIndex = -1
    }
    
    init(location: Location, ownerUser: User) {
        self._rowCount = 1
        self._location = location
        self._ownerUser = ownerUser
        self._timestamp = DEFAULT_DOUBLE_VALUE
        self._customViews = []
        self._selectedIndex = -1
//        self._carouselView = FeedCarousel()
        
        self.initCustomView()
    }
    
    // MARK : Fill pin own image url for carousel view
    private func initCustomView() {
        if !self.location.pictureURL.isEmpty {
            addCustomView(imageURL: self.location.pictureURL)
        }
        if !self.location.videoPictureURL.isEmpty {
             addCustomView(imageURL: self.location.videoPictureURL)
        }
        if !self.location.textPictureURL.isEmpty {
             addCustomView(imageURL: self.location.textPictureURL)
        }
        
        // MARK:
        self._selectedIndex = self.numberOfItem() / 2
    }
    
    private func addCustomView(imageURL: String) {
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: Storyboard.Feed.CustomViewWidth, height: Storyboard.Feed.CustomViewHeigh) ,imageURL: imageURL)
        self._customViews.append(customView)
    }
    
    func numberOfItem() -> Int {
        return self._customViews.count
    }
    
    var location : Location {
        get {
            return self._location
        }
        set {
            self._location = newValue
        }
    }
    
    var rowCount: Int {
        get {
            return self._rowCount
        }
        set {
            self._rowCount = newValue
        }
    }
    
    var ownerUser : User {
        get {
            return self._ownerUser
        }
        set {
            self._ownerUser = newValue
        }
    }
    
    var customViews : [CustomView] {
        get {
            return self._customViews
        }
        set {
            self._customViews = newValue
        }
    }
    
    var selectedIndex: Int {
        get {
            return self._selectedIndex
        }
        set {
            self._selectedIndex = newValue
        }
    }
    
    
    
    func getCustomView(index: Int) -> CustomView {
        self.customViews[index].getLoadImage()
        return self.customViews[index]
    }
    
    func locationToString() -> String {
        let loc = self._location
        let noText = ""
        let seperator = "-"
        
        let countryName = !loc.countryName.isEmpty ? loc.countryName : noText
        let cityName = !loc.cityName.isEmpty ? seperator + loc.cityName : noText
        let thorough = !loc.thorough.isEmpty ? seperator + loc.thorough : noText
        
        return countryName + cityName + thorough
    }
    
    func convertTimestamp() -> String {
        let x = _timestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        
        return formatter.string(from: date as Date)
    }
    
}

