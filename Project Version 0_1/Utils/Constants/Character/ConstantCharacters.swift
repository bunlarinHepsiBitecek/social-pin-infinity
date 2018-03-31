//
//  ConstantCharacters.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

let SPACE_CHARACTER = ""
let DEFAULT_DOUBLE_VALUE = 0.0
let DEFAULT_INTEGER_VALUE = 0

let TWITTER_CUSTOMER_KEY = "VeQxZvXMp0rdAdAbhqwpQ7a9T"
let TWITTER_CUSTOMER_SECRETKEY = "nPRTbxaonteKlAZg7ltOPpZ2MQ8giEGJCOujehp7ywJlA4CzRK"

let USER_SEND_VERIFICATION_TIME : String = "user_email_verification_time_id"
let USER_ID : String = "user_id"

struct Constants {
    struct RegisterPage {
        static let DATE_PICKER_FORMAT = "dd.MM.yyyy"
    }
    
    struct WelcomeFirstPin {
        static let PIN_IMAGE_NAME = "maps64.png"
        static let Success = "Success"
        static let Dismiss = "Dismiss"
        static let Message = "İlk pininiz başarıyla kaydedildi. Aramıza hoşgeldiniz 🤗"
    }
    
    struct Feed {
        static let FetchingData = "Fetching data..."
    }
}

struct Storyboard {
    struct Feed {
        static let FeedCell = "FeedCell"
        static let FeedHeaderCell = "FeedHeaderCell"
        static let FeedCellHeight: CGFloat = 350.0
        static let FeedHeaderCellHeight: CGFloat = 60.0
        static let CustomViewWidth: CGFloat = 250.0
        static let CustomViewHeigh: CGFloat = 150.0
    }
}
