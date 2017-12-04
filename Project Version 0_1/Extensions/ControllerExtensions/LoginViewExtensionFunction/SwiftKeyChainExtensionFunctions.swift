//
//  SwiftKeyChainExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

extension LoginViewController {
    
    func registerCurrentUserToKeyChain(inputUserID : String, inputUserIDKey : String) {
        
        let _ : Bool = KeychainWrapper.standard.set(inputUserID, forKey: inputUserIDKey)
        
    }
    
}
