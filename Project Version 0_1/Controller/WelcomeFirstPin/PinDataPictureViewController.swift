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
    @IBOutlet var processDoneButton: UIButton!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pinDataImage.image = image
        self.getPictureChoiseByTappingProfileImage()
        //pinDataImage.setRoundedDesignToProfilePictureImageViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkPictureButtonClicked(_ sender: Any) {
        
        if let presenter = presentingViewController as? WelcomeFirstPinViewController {
            print("got")
            presenter.boko = pinDataImage.image!
            presenter.cameraButton.setImage(pinDataImage.image!, for: .normal)
        }
        
        self.dismiss(animated: true) {
        
            print("olay bitmiştir")
            
        }
        
    }
    
    @IBAction func crossPictureButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true) {
            
            print("olay bitmiştir")
            
        }
        
    }
    
    func getPictureChoiseByTappingProfileImage() {
        
        pinDataImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDecideHowProfilePictureLoads)))
        pinDataImage.isUserInteractionEnabled = true
        
    }
    

}
