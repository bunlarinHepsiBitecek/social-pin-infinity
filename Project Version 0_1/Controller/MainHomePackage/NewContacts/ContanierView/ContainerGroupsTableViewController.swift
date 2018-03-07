//
//  ContainerGroupsTableViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2/28/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ContainerGroupsTableViewController: UIViewController {

    @IBOutlet var tableViewGroups: UITableView!
    
    var groupObject = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constantUserGroupDataObject.createSectionsForGroups()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
