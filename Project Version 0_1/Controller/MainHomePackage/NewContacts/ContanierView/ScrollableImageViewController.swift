//
//  ScrollableImageViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/2/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ScrollableImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollViewObject: UIScrollView!
    @IBOutlet var imageViewObject: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollViewObject.contentSize = CGSize(width: scrollViewObject.frame.width, height: 416)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("Yakaladın sonunda aq")
        
    }


}
