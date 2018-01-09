//
//  PinDropButtonObjects.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 5.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PinDropButtonObjects {
    
    private var _pinButtonOnlyMe : CGPoint
    private var _pinButtonAllFriends : CGPoint
    private var _pinButtonSpecialPersonOrGroup : CGPoint
    private var _pinButtonConfirm : CGPoint
    private var _pinButtonDelete : CGPoint
    
    private var _centerInfoForSelectedButton : CGPoint
    
    private var _pinButtonOnlyMeClicked : Bool
    private var _pinButtonAllFriendsClicked : Bool
    private var _pinButtonSpecialPersonOrGroupClicked : Bool
    
    init() {
    
        _pinButtonOnlyMe = CGPoint()
        _pinButtonAllFriends = CGPoint()
        _pinButtonSpecialPersonOrGroup = CGPoint()
        _pinButtonConfirm = CGPoint()
        _pinButtonDelete = CGPoint()
        
        _centerInfoForSelectedButton = CGPoint()
        
        _pinButtonOnlyMeClicked = false
        _pinButtonAllFriendsClicked = false
        _pinButtonSpecialPersonOrGroupClicked = false
        
    }
    
    var pinButtonOnlyMe : CGPoint {
        
        get {
            
            return self._pinButtonOnlyMe
            
        }
        
        set(inputCGPoing) {
            
            self._pinButtonOnlyMe = inputCGPoing
        }
        
    }
    
    var pinButtonAllFriends : CGPoint {
        
        get {
            
            return self._pinButtonAllFriends
            
        }
        
        set(inputCGPoint) {
            
            self._pinButtonAllFriends = inputCGPoint
            
        }
        
    }
    
    var pinButtonSpecialPersonOrGroup : CGPoint {
        
        get {
            
            return self._pinButtonSpecialPersonOrGroup
            
        }
        
        set(inputCGPoint) {
            
            self._pinButtonSpecialPersonOrGroup = inputCGPoint
            
        }
        
    }

    var pinButtonConfirm : CGPoint {
        
        get {
            
            return self._pinButtonConfirm
            
        }
        
        set(inputCGPoing) {
            
            self._pinButtonConfirm = inputCGPoing
        }
        
    }
    
    var pinButtonDelete : CGPoint {
        
        get {
            
            return self._pinButtonDelete
            
        }
        
        set(inputCGPoing) {
            
            self._pinButtonDelete = inputCGPoing
        }
        
    }
    
    var centerInfoForSelectedButton : CGPoint {
        
        get {
            
            return _centerInfoForSelectedButton
            
        }
        
        set(inputCGPoint) {
            
            self._centerInfoForSelectedButton = inputCGPoint
            
        }
    }

    var pinButtonOnlyMeClicked : Bool {
        
        get {
            
            return _pinButtonOnlyMeClicked
            
        }
        
        set(inputBooleanValue) {
            
            self._pinButtonOnlyMeClicked = inputBooleanValue
            
        }
    }
    
    var pinButtonAllFriendsClicked : Bool {
        
        get {
            
            return _pinButtonAllFriendsClicked
            
        }
        
        set(inputBooleanValue) {
            
            self._pinButtonAllFriendsClicked = inputBooleanValue
            
        }
    }
    
    var pinButtonSpecialPersonOrGroupClicked : Bool {
        
        get {
            
            return _pinButtonSpecialPersonOrGroupClicked
            
        }
        
        set(inputBooleanValue) {
            
            self._pinButtonSpecialPersonOrGroupClicked = inputBooleanValue
            
        }
    }

    func resetClickedInfo() {
        
        _pinButtonAllFriendsClicked = false
        _pinButtonOnlyMeClicked = false
        _pinButtonSpecialPersonOrGroupClicked = false
        
    }
    


}
