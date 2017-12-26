//
//  PinDataPictureViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 22.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class PinDataPictureViewController: UIViewController {

    @IBOutlet var pinDataPictureView: UIView!
    @IBOutlet var pinDataImage: UIImageView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var exitButton: UIButtonCustomDesign!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.getPictureChoiseByTappingProfileImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkPictureButtonClicked(_ sender: Any) {
        
        setPictureDataOnPin()
        
    }
    
    @IBAction func exitButtonClicked(_ sender: Any) {
        
        dismissCurrentView()
        
    }

}
