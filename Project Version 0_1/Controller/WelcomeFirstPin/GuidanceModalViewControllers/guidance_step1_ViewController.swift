//
//  guidance_step1_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 20.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class guidance_step1_ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //print("guidance_step1_ViewController starts")
        print("guidance_step1_ViewController - User : \(user.userID)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoGuidanceNext(_ sender: Any) {
        
        
        label.text = ""
        button1.setTitle("", for: .normal)
        button2.setTitle("", for: .normal)
        
        performSegue(withIdentifier: ViewConstants.SegueConstants.gotoGuidance2, sender: self)
        
    }
    
    @IBAction func exitToMainScreen(_ sender: Any) {
        
        performSegue(withIdentifier: ViewConstants.SegueConstants.goToMainHomePageFromGuidance, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == ViewConstants.SegueConstants.gotoGuidance2 {
            
            if let guidance_2 = segue.destination as? guidance_step2_ViewController {
                guidance_2.user = user
            }
            
        } else if segue.identifier == ViewConstants.SegueConstants.goToMainHomePageFromGuidance {
            
            if let homePage = segue.destination as?  HomePageViewController {
                homePage.user = user
            }
            
        }
        
    }

}
