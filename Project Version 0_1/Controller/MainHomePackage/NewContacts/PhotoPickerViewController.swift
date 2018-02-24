//
//  PhotoPickerViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 18.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PhotoPickerViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var scrollViewObject: UIScrollView!
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollViewObject.delegate = self
        
        scrollViewObject.isUserInteractionEnabled = true
        
        imageView.frame = CGRect(x: 0, y: 0, width: scrollViewObject.frame.width, height: scrollViewObject.frame.height)
        imageView.image = UIImage(named: "556c83b791f3f8325a657fed2c7bee59--iphone--wallpaper-phone-wallpapers.jpg")
        imageView.isUserInteractionEnabled = true
        
        scrollViewObject.addSubview(imageView)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loadImage))
        tapGestureRecognizer.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        UIApplication.shared.isStatusBarHidden = true
        
    }
    
    @objc func loadImage(recognizer : UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        
        let scrollViewFrame = scrollViewObject.frame
        
        let scaleWidth = scrollViewObject.frame.width / scrollViewObject.contentSize.width
        let scaleHeight = scrollViewObject.frame.height / scrollViewObject.contentSize.height
        
        let minScale = min(scaleHeight, scaleWidth)
        
        scrollViewObject.minimumZoomScale = minScale
        scrollViewObject.maximumZoomScale = 1
        scrollViewObject.zoomScale = minScale
        
        centerScrollviewContents()
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func centerScrollviewContents() {
        
        let boundSize = scrollViewObject.bounds.size
        var contentFrame = imageView.frame
        
        if contentFrame.size.width < boundSize.width {
            
            contentFrame.origin.x = (boundSize.width - contentFrame.size.width) / 2
            
        } else {
            
            contentFrame.origin.x = 0
            
        }
        
        if contentFrame.size.height < boundSize.height {
            
            contentFrame.origin.y = (boundSize.height - contentFrame.size.height) / 2
            
        } else {
            
            contentFrame.origin.y = 0
            
        }
        
        imageView.frame = contentFrame
        
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        centerScrollviewContents()
        
    }
    
    /*
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
        
    }*/
    
    /*
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }*/
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func g(_ sender: Any) {
        
        UIApplication.shared.isStatusBarHidden = false
        
        self.dismiss(animated: true, completion: nil)
        
    }
    


}
