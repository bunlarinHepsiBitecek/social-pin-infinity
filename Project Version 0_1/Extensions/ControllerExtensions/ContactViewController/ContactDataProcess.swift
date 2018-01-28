//
//  ContactDataProcess.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 26.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ContactsViewController2 {
    
    func rearrangeDataForCache() {
        
        if let unwrappedObject = denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString) {
        
            sectionBasedObject = unwrappedObject
            
            // if at least one image is downloaded from firebase, we can use only cache to  show images in tableview
            for checkUserFriend in sectionBasedObject.tempUserFriendsDictionary {
                
                print("içerideyiz")
                print("checkUserFriend.userImageLoaded : \(checkUserFriend.userImageLoaded)")
                
                if checkUserFriend.userImageLoaded {
                    return
                }
                
            }
            
            // sorted A -> Z
            sectionBasedObject.tempUserFriendsDictionarySorted = unwrappedObject.tempUserFriendsDictionary.sorted(by:{ $0.userFriendChildData.userName < $1.userFriendChildData.userName})
            
            for userFriendObject in sectionBasedObject.tempUserFriendsDictionarySorted {
                
                if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.A) {
                    
                    sectionBasedObject.friendListInitial_A.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.B){
                    
                    sectionBasedObject.friendListInitial_B.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.C) {
                    
                    sectionBasedObject.friendListInitial_C.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.D){
                    
                    sectionBasedObject.friendListInitial_D.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.E) {
                    
                    sectionBasedObject.friendListInitial_E.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.F){
                    
                    sectionBasedObject.friendListInitial_F.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.G) {
                    
                    sectionBasedObject.friendListInitial_G.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.H){
                    
                    sectionBasedObject.friendListInitial_H.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.I) {
                    
                    sectionBasedObject.friendListInitial_I.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.J){
                    
                    sectionBasedObject.friendListInitial_J.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.K) {
                    
                    sectionBasedObject.friendListInitial_K.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.L){
                    
                    sectionBasedObject.friendListInitial_L.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.M) {
                    
                    sectionBasedObject.friendListInitial_M.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.N){
                    
                    sectionBasedObject.friendListInitial_N.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.O) {
                    
                    sectionBasedObject.friendListInitial_O.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.P){
                    
                    sectionBasedObject.friendListInitial_P.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Q) {
                    
                    sectionBasedObject.friendListInitial_Q.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.R) {
                    
                    sectionBasedObject.friendListInitial_R.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.S){
                    
                    sectionBasedObject.friendListInitial_S.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.T) {
                    
                    sectionBasedObject.friendListInitial_T.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.U){
                    
                    sectionBasedObject.friendListInitial_U.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.V) {
                    
                    sectionBasedObject.friendListInitial_V.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.W){
                    
                    sectionBasedObject.friendListInitial_W.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.X) {
                    
                    sectionBasedObject.friendListInitial_X.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Y){
                    
                    sectionBasedObject.friendListInitial_Y.append(userFriendObject)
                    
                } else if userFriendObject.userFriendChildData.userName.hasPrefix(LetterConstants.Z) {
                    
                    sectionBasedObject.friendListInitial_Z.append(userFriendObject)
                    
                }
                
            }
            
            if sectionBasedObject.friendListInitial_A.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.A] = sectionBasedObject.friendListInitial_A
                
            }
            
            if sectionBasedObject.friendListInitial_B.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.B] = sectionBasedObject.friendListInitial_B
                
            }
            
            if sectionBasedObject.friendListInitial_C.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.C] = sectionBasedObject.friendListInitial_C
                
            }
            
            if sectionBasedObject.friendListInitial_D.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.D] = sectionBasedObject.friendListInitial_D
                
            }
            
            if sectionBasedObject.friendListInitial_E.count > 0 {
                
                print("e count : \(sectionBasedObject.friendListInitial_E.count)")
                
                sectionBasedObject.sectionDictionary[LetterConstants.E] = sectionBasedObject.friendListInitial_E
                
            }
            
            if sectionBasedObject.friendListInitial_F.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.F] = sectionBasedObject.friendListInitial_F
                
            }
            
            if sectionBasedObject.friendListInitial_G.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.G] = sectionBasedObject.friendListInitial_G
                
            }
            
            if sectionBasedObject.friendListInitial_H.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.H] = sectionBasedObject.friendListInitial_H
                
            }
            
            if sectionBasedObject.friendListInitial_I.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.I] = sectionBasedObject.friendListInitial_I
                
            }
            
            if sectionBasedObject.friendListInitial_J.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.J] = sectionBasedObject.friendListInitial_J
                
            }
            
            if sectionBasedObject.friendListInitial_K.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.K] = sectionBasedObject.friendListInitial_K
                
            }
            
            if sectionBasedObject.friendListInitial_L.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.L] = sectionBasedObject.friendListInitial_L
                
            }
            
            if sectionBasedObject.friendListInitial_M.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.M] = sectionBasedObject.friendListInitial_M
                
            }
            
            if sectionBasedObject.friendListInitial_N.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.N] = sectionBasedObject.friendListInitial_N
                
            }
            
            if sectionBasedObject.friendListInitial_O.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.O] = sectionBasedObject.friendListInitial_O
                
            }
            
            if sectionBasedObject.friendListInitial_P.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.P] = sectionBasedObject.friendListInitial_P
                
            }
            
            if sectionBasedObject.friendListInitial_Q.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.Q] = sectionBasedObject.friendListInitial_Q
                
            }
            
            if sectionBasedObject.friendListInitial_R.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.R] = sectionBasedObject.friendListInitial_R
                
            }
            
            if sectionBasedObject.friendListInitial_S.count > 0 {
                
                print("s count : \(sectionBasedObject.friendListInitial_S.count)")
                
                sectionBasedObject.sectionDictionary[LetterConstants.S] = sectionBasedObject.friendListInitial_S
                
            }
            
            if sectionBasedObject.friendListInitial_T.count > 0 {
                
                print("t count : \(sectionBasedObject.friendListInitial_T.count)")
                
                sectionBasedObject.sectionDictionary[LetterConstants.T] = sectionBasedObject.friendListInitial_T
                
            }
            
            if sectionBasedObject.friendListInitial_U.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.U] = sectionBasedObject.friendListInitial_U
                
            }
            
            if sectionBasedObject.friendListInitial_V.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.V] = sectionBasedObject.friendListInitial_V
                
            }
            
            if sectionBasedObject.friendListInitial_W.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.W] = sectionBasedObject.friendListInitial_W
                
            }
            
            if sectionBasedObject.friendListInitial_X.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.X] = sectionBasedObject.friendListInitial_X
                
            }
            
            if sectionBasedObject.friendListInitial_Y.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.Y] = sectionBasedObject.friendListInitial_Y
                
            }
            
            if sectionBasedObject.friendListInitial_Z.count > 0 {
                
                sectionBasedObject.sectionDictionary[LetterConstants.Z] = sectionBasedObject.friendListInitial_Z
                
            }
            
            sectionBasedObject.keyData = Array(sectionBasedObject.sectionDictionary.keys).sorted()
            
            denemeCache2.setObject(sectionBasedObject, forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
            
        }
        
        getImagesFromDataStorage()
        
    }
    
    func getImagesFromDataStorage() {
        
        if let unwrappedSectionBasedObj = denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString) {
            
            for userFriendItem in unwrappedSectionBasedObj.tempUserFriendsDictionarySorted {
                
                if !userFriendItem.userFriendChildData.userImageUrl.isEmpty {
                    
                    let url = URL(string: userFriendItem.userFriendChildData.userImageUrl)
                    
                    let request = URLRequest(url: url!)
                    
                    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                        
                        if error != nil {
                            
                            if let errorMessage = error as NSError? {
                                
                                print("errorMessage : \(errorMessage.localizedDescription)")
                                
                            }
                            
                        } else {
                            
                            if let image = UIImage(data: data!) {
                                
                                DispatchQueue.main.async(execute: {
                                    
                                    userFriendItem.userImage = image
                                    userFriendItem.userImageLoaded = true
                                    denemeCache2.setObject(unwrappedSectionBasedObj, forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
                                    
                                    self.friendsTableView.reloadData()
                                })
                                
                            }
                            
                        }
                        
                    })
                    
                    task.resume()
                    
                }
                
            }
            
        }
    
    }
    
}
