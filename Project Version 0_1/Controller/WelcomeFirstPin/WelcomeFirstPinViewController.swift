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
    @IBOutlet var focusCurrentLocation: UIButton!
    
    // data
    var user: User = User()
    var locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    let latitudeDeltaDegree: CLLocationDegrees = 0.002
    let longitudeDeltaDegree: CLLocationDegrees = 0.002
    
    var imageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.disableNavigationBar()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()

        mapView.delegate = self
        mapView.showsUserLocation = true
        
        //mapView.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("Remzi locationManager UpdateHeading girdi")
        mapView.camera.heading = newHeading.magneticHeading
        mapView.setCamera(mapView.camera, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Remzi:  WelcomeFirstPinViewController viewWillAppear girdi")
        super.viewWillAppear(animated)
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
        print("Remzi: WelcomeFirstPinViewController mapView girdi")
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kPersonAnnotationName)
        
        if annotationView == nil {
            print("annotation nil")
            annotationView = PersonAnnotationView(annotation: annotation, reuseIdentifier: kPersonAnnotationName)
            print("------1")
            (annotationView as! PersonAnnotationView).personDetailDelegate = self
            print("------2")
            
            // user burada set edilerek update edilmeli güncel location bilgileri için
            (annotationView as! PersonAnnotationView).customCalloutView?.person = user
            print("------3")
        } else {
            print("annotation dolu")
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    @IBAction func currentLocationButton(_ sender: UIButton) {
        locationManager.stopUpdatingLocation()
        locationManager.startUpdatingLocation()
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
    func addImageRequestForPerson(person: User) {
        print("Remzi: addImageRequestForPerson")
        self.askGetPicture()
        print("Remzi: addImageRequestForPerson bitti")
    }
    
    // delegation Methot
    func addVideoRequestForPerson(person: User) {
        print("Remzi: addVideoRequestForPerson")
    }
    
    // delegation Methot
    func addTextRequestForPerson(person: User) {
        print("Remzi: addTextRequestForPerson")
        
    }
    
    func okRequestForPerson(person: User) {
        print("Remzi: ok click")
    }
    
    func cancelRequestForPerson(person: User) {
        print("Remzi: cancel click")
    }
    
}
