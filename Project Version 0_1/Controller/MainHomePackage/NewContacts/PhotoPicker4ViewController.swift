//
//  PhotoPicker4ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/20/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class PhotoPicker4ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableViewForPhotoManagement: UITableView!
    @IBOutlet var containerViewObject: UIView!
    
    var childScrollableView : ScrollableImageViewController!
    
    var sectionHeaders = ["erkut1"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
        if indexPath.section == 0 {
            
            let cell = tableViewForPhotoManagement.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.imageView?.image = UIImage(named: "cancel_shadow.png")
            cell.textLabel?.text = "Remzi deneme1"
            
            return cell
            
        }
        
        return UITableViewCell()*/
        
        
        let cell = tableViewForPhotoManagement.dequeueReusableCell(withIdentifier: CommonConstants.TableViewConstants.CellConstants.CellTableViewPhotoLibraryCollection, for: indexPath) as! PhotoPickerTableViewCell
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionHeaders[section]
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 1000
        
    }

    /*
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
       
        print("zoom etik")
       
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        

        
        print("erkut")
        
  
    }
    */

}
