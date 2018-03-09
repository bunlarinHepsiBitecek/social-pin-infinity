//
//  ShowPinsOnMapViewController.swift
//  Project Version 0_1
//
//  Created by Remzi on 06/01/2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


class ShowPinsOnMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // outlets
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var mapView: MKMapView!
    
    //var
    var user: User = User()
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.disableNavigationBar()
        self.navigationController?.enableNavigationBar()
        
        /*
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10.0
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        
        let trackingButton = MKUserTrackingButton(mapView: self.mapView)
        trackingButton.frame.origin = CGPoint(x: self.view.frame.width - 40, y: 80)
        self.view.addSubview(trackingButton)
        
        //sil
        user.setUserID(inputUserID: "3DHQI81gRzaaFVTKFkAEhCFMw7N2")
        */
        
        user.setUserID(inputUserID: "ngLuLXIv3UhWLq52B8N82ZYBz5u2")
        DatabaseFriends.ds.getDatabaseReferenceFriends.child(user.userID).observe(.value) { (snapshot) in
            guard snapshot.exists() else { return }
            print("*********************start************")
            print(snapshot.value)
            print("**********************end*************")
            
            /*
             if let snap = snapshot.value as? [String:AnyObject] {
             print("Key :\(snap.keys)")
             print("Value :\(snap.values)")
             }
             */
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            print("Me")
            getPinItems()
        } else {
            print("Friends")
        }
    }
    
    /*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("LocationManager Starts.......")
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LATITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees, longitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LONGITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
    }
    */
    
    func getPinItems() {
        print("getPinItems id: \(user.userID)")
        DatabaseUserLocation.ds.getDatabaseReferenceUserLocation.child(user.userID).observe(.value) { (snapshot) in
            guard snapshot.exists() else { return }
            print("*********************start************")
            print(snapshot.value)
            print("**********************end*************")
            
            /*
            if let snap = snapshot.value as? [String:AnyObject] {
                print("Key :\(snap.keys)")
                print("Value :\(snap.values)")
            }
            */
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAP f: \(snap)")
                    print("   SNAP k: \(snap.key)")
                    print("   SNAP v: \(snap.value)")
                    
                    DatabaseLocation.ds.getDatabaseReferenceLocation.child(snap.key).observe(.value) { (snapshotLocation) in
                        guard snapshotLocation.exists() else { return }
                        print("\(snap.key)")
                        print(" D*********************start************")
                        print(snapshotLocation.value)
                        print(" D**********************end*************")
                        
                        if let dictionary = snapshotLocation.value as! NSDictionary? {
                            print("lat: \(dictionary["latitude"])")
                           // _ = Location(snapshot: dictionary, userID: self.user.userID)
                        }
                        
                        if let dic = snapshotLocation.value as! Dictionary<String, Any>? {
                            _ = Location(data: dic, locationID: snap.key)
                        }
                        
                        /*
                        if let snapshotLocation = snapshotLocation.children.allObjects as? [DataSnapshot] {
                            for snapLoc in snapshotLocation {
                                print("  SNAPL f: \(snapLoc)")
                                print("     SNAPL k: \(snapLoc.key)")
                                print("     SNAPL v: \(snapLoc.value)")
                            }
                        }
                        */
                        
                        
                        /*
                        for item in snapshotLocation.children {
                            let locationItem = Location(snapshot: item as! DataSnapshot, userID: self.user.userID)
                        }
                        */
 
                        
                        
                    }
                }
            }
        }
    }
        
    
}
