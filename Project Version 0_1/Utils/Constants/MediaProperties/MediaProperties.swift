//
//  MediaProperties.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 29.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import AVFoundation

struct ConstantsMediaProperties {
    
    struct VideoProperties {
        
        static let selectedVideoDurationLimit : Float64 = 20.0
        
    }
    
    struct VideoActionSheetConstants {
        
        static let stringValueVideoChoise : String = "Video Yükleme Seçenekleri"
        static let stringValueVideoFromPhotoLibrary : String = "Video Galerisi"
        static let stringValueVideoNewRecord : String = "Yeni Video Kaydet"
        static let stringValueVideoPlay : String = "Video Oynat"
        static let stringValueVideoDelete : String = "Video Sil"
        static let stringValueActionSheetCancelButtonTitle : String = "CANCEL"
        
    }
    
    struct VideoActionSheetWarningSentencesConstants {
        
        static let stringValueVideoGetDeleted : String = "Pin üzerindeki video silinecektir!"
        
    }
    
    struct VideoActionSheetWarningTitles {
    
        static let stringValueVideoDeletedAlertTitle : String = "Uyarı"
        
    }
    
    struct VideoActionSheetAlertButtonTitles {
        
        static let stringValueVideoDeletedConfirmButtonTitle : String = "OK"
        static let stringValueVideoDeletedCancelButtonTitle : String = "Vazgeç"
        
    }
    
}
