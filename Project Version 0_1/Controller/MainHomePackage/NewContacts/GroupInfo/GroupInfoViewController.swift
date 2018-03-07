//
//  GroupInfoViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3/3/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

struct StretchyHeader {
    
    let headerHeight: CGFloat = 418
    let headerCut: CGFloat = 50
    
}

class GroupInfoViewController: UIViewController {

    @IBOutlet var tableViewGroupInfo: UITableView!
    @IBOutlet var viewInsideTableView: UIView!
    @IBOutlet var imageViewForGroupInfo: UIImageView!
    
    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    
    var image : UIImage!
    
    var headerMaskLayer : CAShapeLayer!

    // it's used to map data inside constantUserGroupDataObject
    var groupID : String!
    var group = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        image = UIImage(named: "zach-miles-229113-unsplash.jpg")
//
//        imageViewForGroupInfo.image = image
//
//        setNewView()
        
    }
    
    func updateView(){
        
        tableViewGroupInfo.backgroundColor = UIColor.white
        headerView = tableViewGroupInfo.tableHeaderView
        tableViewGroupInfo.tableHeaderView = nil
        tableViewGroupInfo.rowHeight = UITableViewAutomaticDimension
        tableViewGroupInfo.addSubview(headerView)
        
        newHeaderLayer = CAShapeLayer()
        newHeaderLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = newHeaderLayer
        
        let newHeight = StretchyHeader().headerHeight - StretchyHeader().headerCut/2
        
        tableViewGroupInfo.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        tableViewGroupInfo.contentOffset = CGPoint(x: 0, y: -newHeight)
        setNewView()
    }
    
    
    
    
    func setNewView(){
        
        let newHeight = StretchyHeader().headerHeight - StretchyHeader().headerCut/2
        var getHeaderFrame =  CGRect(x: 0, y: -newHeight, width: tableViewGroupInfo.bounds.width, height: StretchyHeader().headerHeight)
        
        if tableViewGroupInfo.contentOffset.y < newHeight {
            
            getHeaderFrame.origin.y = tableViewGroupInfo.contentOffset.y
            getHeaderFrame.size.height = -tableViewGroupInfo.contentOffset.y + StretchyHeader().headerCut/2
        }
        
        headerView.frame = getHeaderFrame
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: getHeaderFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: getHeaderFrame.height - StretchyHeader().headerCut))
        newHeaderLayer.path = cutDirection.cgPath
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    
}
