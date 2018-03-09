//
//  Feed.swift
//  Project Version 0_1
//
//  Created by Remzi on 17/02/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class Feed {
    
    private var _location : Location
    private var _ownerUser : User
    private var _timestamp : Int
    private var _customViews : [CustomView]
    
    init() {
        self._location = Location()
        self._ownerUser = User()
        self._timestamp = DEFAULT_INTEGER_VALUE
        self._customViews = []
    }
    
    init(location: Location, ownerUser: User) {
        self._location = location
        self._ownerUser = ownerUser
        self._timestamp = DEFAULT_INTEGER_VALUE
        self._customViews = []
        
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
    
    func getCustomView(index: Int) -> CustomView {
        self.customViews[index].getLoadImage()
        return self.customViews[index]
    }
    
}
