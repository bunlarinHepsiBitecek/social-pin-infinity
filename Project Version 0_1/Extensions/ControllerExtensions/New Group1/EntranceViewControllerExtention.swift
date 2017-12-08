//
//  EntranceViewControllerExtention.swift
//  Project Version 0_1
//
//  Created by Remzi on 04/12/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import SwiftKeychainWrapper

extension EntranceViewController {
    // Pop Up Styles
    public enum ProviderType  {
        case facebook, twitter, firebase
        
        public var stringValue: String {
            switch self {
            case .facebook:
                return "facebook"
            case .twitter:
                return "twitter"
            case .firebase:
                return "firebase"
            }
        }
    }
}

extension EntranceViewController {
    func fillUserInformationFromLoginChannel(data: NSDictionary, provider: String) {
        
        if let userEmail = data["email"]  as? String {
            user.setUserEmail(inputEmail: userEmail)
        }
        
        if let userFullName = data["name"]  as? String {
                user.setUserNameSurname(inputNameSurname: userFullName)
        }
        
        if let userGender = data["gender"]  as? String {
            user.setUserGender(inputUserGender: userGender)
        }
        
        if let userBirthday = data["user_birthday"]  as? String {
            user.setUserBirthday(inputUserBirthday: userBirthday)
        }
        
        if let userMobilePhone = data["phone"]  as? String {
            user.setUserMobilePhone(inputUserMobilePhone: userMobilePhone)
        }
        
        if let provider = provider as? String {
            user.setUserProvider(inputUserProvider: provider)
        }
        
        if let providerId = data["id"]  as? String {
            user.setUserProviderId(inputUserProviderId: providerId)
        }
        
        print("fillUserInformationFromLoginChannel bitti")
        user.printUserInfo()
        
    }
    
    func complateFillUserInformation(id: String) {
        if let userId = id as?  String {
            user.setUserID(inputUserID: userId)
        }
        
        user.printUserInfo()
    }
    
    func setUserProfilePictureUrl(uid: String, provider: String) {
        if (provider == ProviderType.facebook.stringValue) {
            let facebookProfilePicURL = "https://graph.facebook.com/\(uid)/picture?type=large"
            user.setUserProfilePictureUrl(inputUrl: facebookProfilePicURL)
            user.setUserProfilePicture(inputUserProfileImage: getPictureFromUrl(imageURLString: facebookProfilePicURL)!)
        }
        
    }
    
    func getPictureFromUrl(imageURLString: String) -> UIImage? {
        if let imageURLString = imageURLString as? String {
            var imgURL = NSURL(string: imageURLString)
            var imageData = NSData(contentsOf: imgURL! as URL)
            var image = UIImage(data: imageData! as Data)
            return image
        }
        return nil
    }
}

//facebook login
extension EntranceViewController {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Remzi FB Button Login OK")
        
        if let error = error {
            print("There is an error: \(error)")
            return
        }
        
        print("***** Token: \(FBSDKAccessToken.current().tokenString)")
        
        
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, name, first_name, last_name, age_range, gender, email"], tokenString: FBSDKAccessToken.current().tokenString, version: nil, httpMethod: "GET")
        
        
        req?.start(completionHandler: { (connection, result, error) in
            
            if(error != nil) {
                print("GET request error: \(error)")
            } else {
                print("GET request success result: \(result)")
                
                let data = result as! NSDictionary
                
                print("result as a data form: \(data)")
                
                self.fillUserInformationFromLoginChannel(data: data, provider: ProviderType.facebook.stringValue)
                self.setUserProfilePictureUrl(uid: self.user.providerId, provider: ProviderType.facebook.stringValue)
            }
        })
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        self.firebaseAuth(credential)
 
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Remzi FB Button Logout OK")
        
    }
    
}

// Firebase Login with Credential
extension EntranceViewController {
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("REMZİ: Unable to authenticate with Firebase")
                print(error)
            } else {
                print("REMZİ: Successfullty authenticate with Firebase")
                if let user = user {
                    self.complateSignIn(id: user.uid)
                }
            }
        }
    }
    
    func complateSignIn(id: String ) {
        complateFillUserInformation(id: id)
        createFirebaseUser()
        KeychainWrapper.standard.set(id, forKey: USER_ID)
        print("****REMZİ : Data saved keychain***")
        gotoMainPage()
    }
    
    func createFirebaseUser() {
        
        DatabaseUser.ds.createFirbaseDatabaseUser(userID: self.user.userID, userData: self.user.getUserJSONObject())
        
        print("****REMZİ : User Created to Firebase")
    }
}



// Twitter
extension EntranceViewController {
    
    func twitterLogin() {
        // twitter
        let twitterOwnLoginButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                
                print("REMZİ Twitter dönen session: \(session)")
                print("signed in as \(session?.userName)");
                
                
                // get user twitter email address
                let client = TWTRAPIClient.withCurrentUser()
                
                client.requestEmail { email, error in
                    if (email != nil) {
                        print("get email user: \(session?.userName) and email: \(email)");
                    } else {
                        print("get email error: \(error?.localizedDescription)");
                    }
                }
                
                
                let credential = TwitterAuthProvider.credential(withToken: (session?.authToken)!, secret: (session?.authTokenSecret)!)
                self.firebaseAuth(credential)
            } else {
                print("error: \(error?.localizedDescription)");
            }
        })
        
        twitterOwnLoginButton.frame = CGRect(x: 1, y: 1, width: facebookLoginButton.frame.width, height: facebookLoginButton.frame.height)
        self.twitterLoginButton.addSubview(twitterOwnLoginButton)
    }
}

