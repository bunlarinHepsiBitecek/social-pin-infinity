//
//  GroupCreationViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 12.02.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class GroupCreationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var selectedGroupFriendsCollectionView: UICollectionView!
    
    var user = User()
    
    var deneme = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        deneme.append("erkut")
        deneme.append("bas")
        
        selectedGroupFriendsCollectionView.indexDisplayMode = .automatic
        
        selectedGroupFriendsCollectionView.isUserInteractionEnabled = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
            return 100
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let cell = selectedGroupFriendsCollectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as! GroupCreationCollectionViewCell
            
            return cell
            
        } else if indexPath.section == 1 {
            
            let cell = selectedGroupFriendsCollectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as! GroupCreationCollectionViewCell
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
        
        
        
    }
    

//    func indexTitles(for collectionView: UICollectionView) -> [String]? {
//
//        return deneme
//
//    }
    
    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        
        print("deneme 1  :\(deneme[0])")
        print("deneme 2  :\(deneme[1])")
        
        return ["yarro", "baskan"]
    }
    
    func scrollToSection(_ section:Int)  {
        
        print("scrollToSection starts")
        
        if let cv = self.selectedGroupFriendsCollectionView {
            let indexPath = IndexPath(item: 1, section: section)
            if let attributes =  cv.layoutAttributesForSupplementaryElement(ofKind: UICollectionElementKindSectionHeader, at: indexPath) {
                
                let topOfHeader = CGPoint(x: 0, y: attributes.frame.origin.y - cv.contentInset.top)
                cv.setContentOffset(topOfHeader, animated:true)
            }
        }
    }
    
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        print("referenceSizeForHeaderInSection starts")
        
        let x = CGSize(width: 50, height: 50)
        
        return x
        
    }*/
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        print("UICollectionReusableView starts")
        print("Kind : \(kind)")
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            print("header")
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "groupCreationHeader", for: indexPath) as! GroupCreationHeaderCollectionReusableView
            
            
            headerView.groupName.text = "test"
            
            return headerView
            
            
        default:
            print("nothing")
        }
        
        return UICollectionReusableView()
            
    }
    
    
//    @objc(collectionView:layout:insetForSectionAtIndex:)   func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        
//        print("insetForSectionAtIndex starts")
//        
//        return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 1.0, right: 1.0)
//    }
    

}
