//
//  WelcomeFirstPin_2_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 16.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

private let pinDataAnnotationName = "pinDataAnnotationName"

class WelcomeFirstPinViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var user: User = User()
    var locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    let latitudeDeltaDegree: CLLocationDegrees = 0.002
    let longitudeDeltaDegree: CLLocationDegrees = 0.002
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.disableNavigationBar()
        
        print("welcomeFirstPin starts")
        print("userID : \(user.userID)")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsCompass = true
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("LocationManager Starts.......")
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        
        // current location bilgisi saklanir
        user.userLocationObject.setCurrentLocation(locationCoordinate: location)
        //user.userLocationObject.toPrint()
        
        print("current location getted and setted")
    }
    
    /*
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 4
            return polylineRenderer
        }
        return nil
    }*/
    
    @IBAction func dropPinButtonTapped(_ sender: UIButton) {
        //addPinAnnotation(for: mapView.centerCoordinate)
        if !user.userLocationObject.isPinDropped {
            addPinAnnotation(for: user.userLocationObject.currenLocation)
            // current location alındığı bilgisi set edilir
            self.user.userLocationObject.setIsPinDropped(isPinDropped: true)
            //user.userLocationObject.toPrint()
        }
    }
    
    func addPinAnnotation(for coordinate: CLLocationCoordinate2D) {
        
        print("yarro yarro .......")
        
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                
                print("yarro 2 .....")

                self.setParsedLocationData(inputPlaceMark: placemark)
                
                /*
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = placemark.name
                annotation.subtitle = placemark.locality

                
                self.mapView.addAnnotation(annotation)*/
                
                /*
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "yarro kral"
                annotation.subtitle = "yarro kral 2"
                    
                self.mapView.addAnnotation(annotation)*/
                
                let k = PinDataChoiseAnnotationModel(person: self.user)
                self.mapView.addAnnotation(k)
                
                
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("Erkut: mapView girdi")
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pinDataAnnotationName)
        
        if annotationView == nil {
            annotationView = PinDataChoiseAnnotationView(annotation: annotation, reuseIdentifier: pinDataAnnotationName)
            //(annotationView as! PinDataChoiseAnnotationView).pinDataChoiseDelegate = self
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    
    
    
    @IBAction func zoomInTapped(_ sender: UIButton) {
        zoomInMap()
    }
    @IBAction func zoomOutTapped(_ sender: UIButton) {
        zoomOutMap()
    }
    
    func zoomInMap() {
        var region: MKCoordinateRegion = self.mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        self.mapView.setRegion(region, animated: true)
    }
    
    func zoomOutMap() {
        var region: MKCoordinateRegion = self.mapView.region
        region.span.latitudeDelta  = min(region.span.latitudeDelta  * 2.0, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta * 2.0, 180.0)
        self.mapView.setRegion(region, animated: true)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            print("Device was shaken")
            if !user.userLocationObject.isPinDropped {
                addPinAnnotation(for: user.userLocationObject.currenLocation)
                // current location alındığı bilgisi set edilir
                self.user.userLocationObject.setIsPinDropped(isPinDropped: true)
                //user.userLocationObject.toPrint()
            }
        }
    }
    
    
}

/*
extension MKPointAnnotation {
    
    func showPopOver(popOverStyle: FTPopOverStyle) {
        let menuOptionNameArray : [String] =  [popOverStyle.popOverMessage]
        let menuOptionImageNameArray : [String] = []
        
        self.changePopupStyle()
        FTPopOverMenu.showForSender(sender: self, with: menuOptionNameArray, menuImageArray: menuOptionImageNameArray, done: { (selectedIndex) -> () in         }) {
        }
    }
    
    func changePopupStyle() {
        
        let config = FTConfiguration.shared
        config.textColor = UIColor.red
        config.backgoundTintColor = UIColor.white
        config.borderColor = UIColor.red
        config.menuWidth = self.frame.width
        config.menuSeparatorColor = UIColor.white
        config.textAlignment = .left
        config.textFont = UIFont.systemFont(ofSize: 14)
        config.menuRowHeight = self.frame.height
        config.cornerRadius = 10
    }
    
}*/

extension MKAnnotationView {
    
    func showPopOver(popOverStyle: FTPopOverStyle) {
        let menuOptionNameArray : [String] =  [popOverStyle.popOverMessage]
        let menuOptionImageNameArray : [String] = []
        
        self.changePopupStyle()
        FTPopOverMenu.showForSender(sender: self, with: menuOptionNameArray, menuImageArray: menuOptionImageNameArray, done: { (selectedIndex) -> () in         }) {
        }
    }
    
    func changePopupStyle() {
        
        let config = FTConfiguration.shared
        config.textColor = UIColor.red
        config.backgoundTintColor = UIColor.white
        config.borderColor = UIColor.red
        config.menuWidth = 300
        config.menuSeparatorColor = UIColor.white
        config.textAlignment = .left
        config.textFont = UIFont.systemFont(ofSize: 14)
        config.menuRowHeight = self.frame.height
        config.cornerRadius = 10
    }
}

