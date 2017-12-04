//
//  ProcessingUserData.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setUserData() {
        
        self.userDatabaseObjectToPass.setEmailAndPassword(inputUserEmail: self.email.text!, inputUserPassword: self.password.text!)
        
    }
}
