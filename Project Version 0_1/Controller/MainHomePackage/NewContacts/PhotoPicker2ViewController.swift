//
//  PhotoPicker2ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 18.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PhotoPicker2ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var sv: UIScrollView!
    @IBOutlet var iv: UIImageView!
    
    var gridView:UIView = Bundle.main.loadNibNamed("GridView", owner: nil, options: nil)?.first as! UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "556c83b791f3f8325a657fed2c7bee59--iphone--wallpaper-phone-wallpapers.jpg")
        
        iv.image = image
        iv.frame = CGRect(x: 0, y: 0, width: sv.frame.width + 50, height: sv.frame.height + 50)
        
        sv.delegate = self
        
        sv.minimumZoomScale = 1.0
        sv.maximumZoomScale = 10.0
        
        gridView.frame = sv.frame
        gridView.isHidden = true
        gridView.isUserInteractionEnabled = false
        sv.addSubview(gridView)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return iv
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        gridView.isHidden = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        gridView.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var frame:CGRect = gridView.frame;
        frame.origin.x = scrollView.contentOffset.x
        frame.origin.y = scrollView.contentOffset.y
        gridView.frame = frame
        
        switch scrollView.pinchGestureRecognizer!.state {
        case .changed:
            gridView.isHidden = false
            break
        case .ended:
            gridView.isHidden = true
            break
        default: break
        }
        
    }
    
}
