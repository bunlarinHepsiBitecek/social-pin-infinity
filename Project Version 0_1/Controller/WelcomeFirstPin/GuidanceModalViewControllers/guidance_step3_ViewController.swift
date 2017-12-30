//
//  guidance_step3_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 30.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

class guidance_step3_ViewController: UIViewController {

    var tempMapView = MKMapView()
    var tempUser = User()
    var tempPinData = PinData()
    var tempAnnotation = PersonAnnotation()
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotItButtonClicked(_ sender: Any) {
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
            
            tempUser.isUserGetInformedFromGuidence(inputBooleanValue: true)
            
            destinationViewController.mapView = tempMapView
            destinationViewController.user = tempUser
            destinationViewController.pinDataObject = tempPinData
            destinationViewController.annotation = tempAnnotation
            
            self.dismiss(animated: true, completion: {
                destinationViewController.dropPinOnMap()
            })
            
        }
        
    }
    
    func dismissCurrentView() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
