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

//facebook login
extension EntranceViewController {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Remzi FB Button Login OK")
        
        if let error = error {
            print("There is an error: \(error)")
            return
        }
        
        print("***** Token: \(FBSDKAccessToken.current().tokenString)")
        
        
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: FBSDKAccessToken.current().tokenString, version: nil, httpMethod: "GET")
        
        
        req?.start(completionHandler: { (connection, result, error) in
            
            if(error != nil) {
                print("GET request error: \(error)")
            } else {
                print("GET request success result: \(result)")
                
                let data = result as! NSDictionary
                
                print("result as a data form: \(data)")
                print("Name :\(data["name"]!)")
                print("Mail :\(data["email"]!)")
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
                    //self.complateSignIn(id: user.uid, userEmail: user.email!, provider: user.providerID)
                }
            }
        }
    }
}



// Twitter
extension EntranceViewController {
    
    func twitterLogin() {
        // twitter
        let twitterOwnLoginButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
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

