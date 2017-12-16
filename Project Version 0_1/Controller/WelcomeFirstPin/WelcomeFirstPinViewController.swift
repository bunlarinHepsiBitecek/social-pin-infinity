//
//  WelcomeFirstPin_2_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 16.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

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

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        mapView.delegate = self
        mapView.showsUserLocation = true
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
    
    @IBAction func dropPinButtonTapped(_ sender: UIButton) {
        //addPinAnnotation(for: mapView.centerCoordinate)
        addPinAnnotation(for: user.userLocationObject.currenLocation)
    }
    
    func addPinAnnotation(for coordinate: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = placemark.name
                annotation.subtitle = placemark.locality
                self.mapView.addAnnotation(annotation)
                // current location alındığı bilgisi set edilir
                self.user.userLocationObject.setIsPinDropped(isPinDropped: true)
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
            self.user.userLocationObject.setIsPinDropped(isPinDropped: true)
        }
    }
    

}
