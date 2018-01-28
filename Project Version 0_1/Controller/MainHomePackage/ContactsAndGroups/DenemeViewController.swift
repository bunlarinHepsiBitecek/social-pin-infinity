//
//  DenemeViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 28.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class DenemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("rearrangeDataForCache starts")
        print("denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString) : \(denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString))")
        
        let temp = denemeCache2.object(forKey: CacheConstants.KeyValues.DataPreparedSectionBased as NSString)
        
        for item in (temp?.tempUserFriendsDictionary)! {
            
            
            print("item data : \(item.userFriendChildData.userName)")
            
        }
        
        print("temp data : \(String(describing: temp?.tempUserFriendsDictionary))")
        
    }
    

}
