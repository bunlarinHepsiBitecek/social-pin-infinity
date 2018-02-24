//
//  PhotoPicker4ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/20/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PhotoPicker4ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ScrollableImageDeleagate {

    @IBOutlet var denemeScroll: ScrollableImage!
    @IBOutlet var denemeImage: UIImageView!
    @IBOutlet var tableViewForPhotoManagement: UITableView!
    
    var sectionHeaders = ["erkut1"]
    
    override func viewDidLoad() {
        
        denemeImage.image = UIImage(named: "user.png")
        
        tableViewForPhotoManagement.bounces = true
        denemeScroll.delegatePass = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableViewForPhotoManagement.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.imageView?.image = UIImage(named: "cancel_shadow.png")
            cell.textLabel?.text = "Remzi deneme1"
            
            return cell
            
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionHeaders[section]
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return denemeImage
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
       
        print("zoom etik")
       
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        

        print("scrollview : \(scrollView)")
        
        
  
    }
    
    func touchBegan() {
        
        print("touchBegan haydaaaa")
        
        self.tableViewForPhotoManagement.isScrollEnabled = false
        self.tableViewForPhotoManagement.isUserInteractionEnabled = true
        self.denemeScroll.isScrollEnabled = true
        self.denemeImage.isUserInteractionEnabled = true
        self.denemeScroll.isUserInteractionEnabled = true
        
    }
    
    func touchMoved() {
        print("touchMoved haydaaa")
    }
    
    
    
    

}
