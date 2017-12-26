//
//  WelcomeFirstPin_2_ViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 16.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

import AVKit
import MobileCoreServices
import AVFoundation

private let pinDataAnnotationName = "pinDataAnnotationName"

class WelcomeFirstPinViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var denemeTextButton: UIButtonCustomDesign!
    
    /*
        pin data
     */
    
    var pinDataObject = PinData()
    
    var controlFlag : Bool = false
    var returnFlag : Bool = true
    
    var boko = UIImage()
    
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
        
        setProfileImage()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("WelcomeFirstPinViewController - viewDidAppear starts")
        print("returnFlag : \(returnFlag)")
        
        if controlFlag == false {
            
            controlFlag = true
            
            performSegue(withIdentifier: "gotoGuidance", sender: self)
            
        }
        
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
        

        manager.stopUpdatingLocation()
        
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
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "goToMainPage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoGuidance" {
            if let guidance_1 = segue.destination as? guidance_step1_ViewController {
                guidance_1.user = user
            }
        }
        
        
    }
    
    @IBAction func denemeTextButtonClicked(_ sender: Any) {
        
        
        
        
        
        
    }
    
    
    
    @IBOutlet var cameraButton: UIButtonCustomDesign!
    
    @IBAction func cameraButtonClicked(_ sender: Any) {
        
        print("ccccccc")
        
        let takasi = storyboard?.instantiateViewController(withIdentifier: "PinDataPictureViewController_storyBoardID") as? PinDataPictureViewController
     
        takasi?.image = boko
        
        present(takasi!, animated: true, completion: nil)
        
    }
    
    func setProfileImage() {
        
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        let userRef = ref.child("Users").child(uid!)
        
        userRef.observeSingleEvent(of: .value) { (dataSnapShot) in
            
            if !dataSnapShot.exists() {
                
                print("cıkıyoruz")
                return
                
            }
            
            
            let userInfo = dataSnapShot.value as! NSDictionary
                
            print("userinfo : \(userInfo)")
            
            let profileUrl = userInfo["profilePictureUrl"] as! String
                
            print("profileUrl : \(profileUrl)")
            
            let storageRef = Storage.storage().reference(forURL: profileUrl)
            
            storageRef.downloadURL(completion: { (url, error) in
                
                if error != nil {
                    
                    if let errorMessage = error as NSError? {
                        
                        print("errorMesssage : \(errorMessage.userInfo)")
                        print("errorMesssage : \(errorMessage.localizedDescription)")
                        
                    }
                    
                } else {
                    
                    print("x")
                    
                    do {
                        
                        let data = try Data(contentsOf: url!)
                        let image = UIImage(data: data as Data)
                        self.cameraButton.setImage(image, for: .normal)
                        self.boko = image!
                        
                        self.pinDataObject.setPictureOnPin(inputPictureOnPin: image!)
                    
                    } catch {
                        
                        print("boku yedik")
                        
                    }
                    
                    
                    
                }
                
            })
            
            
            
            
        }
        
        
    }
    
    @IBOutlet var videoButton: UIButtonCustomDesign!
    
    @IBAction func videoPlayClicked(_ sender: Any) {
        
        print("videoPlayClicked is activated")
        
        self.startGettingVideoProcess()
        
        //playVideo()
        
    }
    
    func playVideo() {
        
        print("playVideo starts")
        
        if let path = Bundle.main.path(forResource: "IMG_0950", ofType: "m4v") {
            
            print("içerideyiz")
            
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                
                video.play()
                
            })
            
        }
        
    }
    
    @IBAction func saveToDatabasePinData(_ sender: Any) {
        
        
        
    }
    
    
}


