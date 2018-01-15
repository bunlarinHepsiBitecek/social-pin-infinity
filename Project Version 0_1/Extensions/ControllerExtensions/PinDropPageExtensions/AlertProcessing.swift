//
//  AlertProcessing.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 14.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import AudioUnit

extension PinDropViewController {
    
    func checkPinDataUploadedToDatabase() {
        
        if pinDataObject.isPinDropped && !pinDataObject.isPinDataUploadedDatabase {
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let alertAppearance = SCLAlertView.SCLAppearance()
            
            let alertView = SCLAlertView(appearance: alertAppearance)
            
            alertView.showWarning("Uyarı", subTitle: "Lütfen bırakılan pin kaydediniz veya siliniz!", closeButtonTitle: "OK")
        }
        
    }
    
}
