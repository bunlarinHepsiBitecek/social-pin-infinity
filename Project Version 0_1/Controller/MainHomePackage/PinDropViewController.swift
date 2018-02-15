//
//  PinDropViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 9.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

private let PinAnnotationName = "kPersonAnnotationName"

class PinDropViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITabBarControllerDelegate, PersonPinDetailMapViewDelegate {

    @IBOutlet var mapViewObject: MKMapView!
    @IBOutlet var buttonPinDropOnlyMe: UIButtonCustomDesign!
    @IBOutlet var buttonPinDropAllFriends: UIButtonCustomDesign!
    @IBOutlet var buttonPinDropSpecialFriends: UIButtonCustomDesign!
    @IBOutlet var buttonDeletePindData: UIButtonCustomDesign!
    @IBOutlet var buttonSavePinData: UIButtonCustomDesign!
    @IBOutlet var buttonPinDropMain: UIButtonCustomDesign!
    
    /*
        to hold the info about main pin drop button is tapped and switch it's function to animate buttons from inside to out
     */
    var mainPinDropButtonClicked : Bool = false
    
    /*
        user object
     */
    var user = User()
    
    /*
     annotation object
     */
    var annotation = PersonAnnotation()
    
    /*
        to hold pindata dropped on mapview
     */
    var pinDataObject = PinData()
    var pinDropObjects = PinDropButtonObjects()
    
    /*
        objects for map processing
     */
    var locationManagerObject = CLLocationManager()
    let geocoderObject = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PinDropViewController starts")
        
        processNeedsToCompleteWhenViewLoaded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processNeedsToCompleteWhenViewLoaded() {
        
        setMapScaleView()
        setLocationManagerProperties()
        setMapViewProperties()
        setTrackingButtonProperties()
        getUserObject()
        relocateSpecificPinDropButtonsBehindMainDropButton()
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: PinAnnotationName)
        
        if annotationView == nil {
            
            annotationView = PersonAnnotationView(annotation: annotation, reuseIdentifier: PinAnnotationName)
            (annotationView as! PersonAnnotationView).personDetailDelegate = self
            
            // user burada set edilerek update edilmeli güncel location bilgileri için
            (annotationView as! PersonAnnotationView).customCalloutView?.person = user
            
        } else {
            
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print("didAddAnnotationViews")
        let visibleRect = mapView.annotationVisibleRect
        //let annotationView: MKAnnotationView = views[0]
        for view:MKAnnotationView in views{
            let endFrame:CGRect = view.frame
            var startFrame:CGRect = endFrame
            startFrame.origin.y = visibleRect.origin.y - startFrame.size.height
            view.frame = startFrame;
            
            UIView.beginAnimations("drop", context: nil)
            UIView.setAnimationDuration(0.5)
            
            view.frame = endFrame;
            
            UIView.commitAnimations()
        }
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        
        print("MKUserTrackingMode starts")
        
        print("mapView.region.span :\(mapView.region.span)")
        
        let spanNew = MKCoordinateSpan(latitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LATITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees, longitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LONGITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees)
        
        var span2 = MKCoordinateSpan()
        span2.latitudeDelta = 0.002
        span2.longitudeDelta = 0.002
        
        mapView.region.span = span2
        
        print("mapView.region.span :\(mapView.region.span)")
        
        print("mapView.region.center : \(mapView.region.center)")
        
        locationManagerObject.startUpdatingLocation()
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        
        print("mapViewDidFinishLoadingMap starts")
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        print("regionDidChangeAnimated starts")
        
        print("mapView.region.span :\(mapView.region.span)")
        
        var span2 = MKCoordinateSpan()
        span2.latitudeDelta = 0.002
        span2.longitudeDelta = 0.002
        
        mapView.region.span = span2
        
        print("mapView.region.span :\(mapView.region.span)")
        
        locationManagerObject.stopUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("locationManager starts")
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LATITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees, longitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LONGITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapViewObject.setRegion(region, animated: true)
        
        pinDataObject.location.currenLocation = location
        
        print("span : \(span)")
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print("PinDropViewController tabBarController starts")
        
    }
    
    /*
        functions below belong to current viewcontroller
     */
    
    @IBAction func mainPinDropClicked(_ sender: Any) {
        
        mainPinDropButtonBackgroundProcessInitiate()
        
    }
    
    @IBAction func allFriendPinDropClicked(_ sender: Any) {
        
        allFriendPinDropButtonBackgroundProcessInitiate()
        
    }
    
    @IBAction func onlyMePinDropClicked(_ sender: Any) {
        
        onlyMePinDropButtonBackgroundProcessInitiate()
        
    }
    
    @IBAction func specialPinDropClicked(_ sender: Any) {

        specialPersonPinDropButtonBackgroundProcessInitiate()
        
    }
    
    @IBAction func pinDataSaveClicked(_ sender: Any) {
        
        pinDataSaveProcessInitiate()
        
    }
    
    @IBAction func deletePinDataClicked(_ sender: Any) {
        
        deletePinDataProcessInitiate()
        
    }
    
    /*
        functions for buttons on pin annotation
     */
    
    func addImageRequestForPerson(pinData: PinData) {
        
        addImageRequestForPersonProcessInitiate()
        
    }
    
    func addVideoRequestForPerson(pinData: PinData) {
        
        addVideoRequestForPersonProcessInitiate()
        
    }
    
    func addTextRequestForPerson(pinData: PinData) {
        
        addTextRequestForPersonProcessInitiate()
        
    }
    
    
    
}


