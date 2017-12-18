//
//  WelcomeFirstPin_2_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 16.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

private let kPersonAnnotationName = "kPersonAnnotationName"

class WelcomeFirstPinViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, PersonPinDetailMapViewDelegate {
    
    // outlets
    @IBOutlet var mapView: MKMapView!
    
    // data
    var user: User = User()
    var locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    let latitudeDeltaDegree: CLLocationDegrees = 0.002
    let longitudeDeltaDegree: CLLocationDegrees = 0.002
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.disableNavigationBar()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        mapView.delegate = self
        mapView.showsUserLocation = true
        
        configureFakePerson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Remzi:  WelcomeFirstPinViewController viewWillAppear girdi")
        super.viewWillAppear(animated)
    }
    
    func configureFakePerson() {
        user.setUserName(inputName: "palaPanti")
        user.setUserNameSurname(inputNameSurname: "Remzi Yıldırım")
        user.setUserProfilePicture(inputUserProfileImage: UIImage(named: "avatar1")!)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("LocationManager Starts.......")
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        
        // current location bilgisi saklanir
        user.userLocationObject.setCurrentLocation(locationCoordinate: location)
        user.userLocationObject.toPrint()
        
        print("current location getted and setted")
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 4
            return polylineRenderer
        }
        return nil
    }
    
    // MARK: - MKMapViewDelegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("Remzi: mapView girdi")
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kPersonAnnotationName)
        
        if annotationView == nil {
            annotationView = PersonAnnotationView(annotation: annotation, reuseIdentifier: kPersonAnnotationName)
            (annotationView as! PersonAnnotationView).personDetailDelegate = self
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    @IBAction func dropPinButtonTapped(_ sender: UIButton) {
        //addPinAnnotation(for: mapView.centerCoordinate)
        if !user.userLocationObject.isPinDropped {
            addPinAnnotation(for: user.userLocationObject.currenLocation)
            // current location alındığı bilgisi set edilir
            self.user.userLocationObject.setIsPinDropped(isPinDropped: true)
            user.userLocationObject.toPrint()
        }
    }
    
    func addPinAnnotation(for coordinate: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                //let annotation = MKPointAnnotation()
                //annotation.coordinate = coordinate
                //annotation.title = placemark.name
                //annotation.subtitle = placemark.locality
                let annotation = PersonAnnotation(person: self.user)
                
                self.mapView.addAnnotation(annotation)
            }
        }
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
                user.userLocationObject.toPrint()
            }
        }
    }
    
    // delegation Methot
    func detailsRequestedForPerson(person: User) {
        print("Remzi: detailsRequestedForPerson")
    }
    
    func addImageRequestForPerson(person: User) {
        print("Remzi: addImageRequestForPerson")
    }
    

}
