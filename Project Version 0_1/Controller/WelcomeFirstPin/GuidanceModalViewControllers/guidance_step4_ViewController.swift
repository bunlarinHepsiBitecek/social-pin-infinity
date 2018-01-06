//
//  guidance_step4_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 4.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class guidance_step4_ViewController: UIViewController {

    var tempMapView = MKMapView()
    var tempUser = User()
    var tempPinData = PinData()
    var tempAnnotation = PersonAnnotation()
    
    var allFriendButtonCenter : CGPoint!
    var onlyMeButtonCenter : CGPoint!
    var specialButtonCenter : CGPoint!
    
    @IBOutlet var buttonOnlyMePin: UIButtonCustomDesign!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonOnlyMePin.setImage(tempUser.userProfilePicture, for: .normal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotItButtonTapped(_ sender: Any) {
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
            
            tempUser.isUserGetInformedFromGuidance4(inputBooleanValue: true)
            
            destinationViewController.mapView = tempMapView
            destinationViewController.user = tempUser
            destinationViewController.pinDataObject = tempPinData
            destinationViewController.annotation = tempAnnotation
            
            destinationViewController.allFriendButtonCenter = self.allFriendButtonCenter
            destinationViewController.onlyMeButtonCenter = self.onlyMeButtonCenter
            destinationViewController.specialButtonCenter = self.specialButtonCenter
            
            self.dismiss(animated: true, completion: {
                //destinationViewController.doTheAnimation()
                print("geri dönüyoruz :)")
            })
            
        }
        
        
    }
    
}
