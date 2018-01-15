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

private let kPersonAnnotationName = "kPersonAnnotationName"

class WelcomeFirstPinViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, PersonPinDetailMapViewDelegate {
    
    @IBOutlet var buttonAllFriends: UIButtonCustomDesign!
    @IBOutlet var buttonOnlyMe: UIButtonCustomDesign!
    @IBOutlet var buttonSpecialFriends: UIButtonCustomDesign!
    
    @IBOutlet var buttonConfirmPinData: UIButtonCustomDesign!
    @IBOutlet var buttonDeletePinData: UIButtonCustomDesign!
    
    @IBOutlet var buttonMainDropPin: UIButtonCustomDesign!
    @IBOutlet var mapView: MKMapView!
    
    var allFriendButtonCenter : CGPoint!
    var onlyMeButtonCenter : CGPoint!
    var specialButtonCenter : CGPoint!
    
    var tempMapView = MKMapView()
    
    var pinDropObjects : PinDropButtonObjects = PinDropButtonObjects()
    
    var mainPinDropButtonTapped : Bool = false
    /*
        pinDataObject will be used to hold all annotation properties; image, video, text dropped onto pin
     */
    var pinDataObject = PinData()
    
    /*
        annotation object
     */
    var annotation = PersonAnnotation()
    
    
    var controlFlag : Bool = false
    var returnFlag : Bool = true
    
    var user: User = User()
    var locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    /*
        viewDidLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.disableNavigationBar()
        
        // the functin below is used to relocate the buttons behind the main drop button
        relocateAdditionalButtonsToCenter()
        
        print("welcomeFirstPin starts")
        print("userID : \(user.userID)")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10.0
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.isRotateEnabled = true
        mapView.isOpaque = true
        
        tempMapView = self.mapView
        
        let trackingButton = MKUserTrackingButton(mapView: self.mapView)
        trackingButton.frame.origin = CGPoint(x: self.view.frame.width - 40, y: 80)
        self.view.addSubview(trackingButton)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("WelcomeFirstPin_2_ViewController viewDidDisappear starts")
        
        locationManager.stopUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("WelcomeFirstPin_2_ViewController viewWillDisappear starts")
        
        locationManager.stopUpdatingLocation()
        
    }
    
    func setupCompassButton() {
        let compass = MKCompassButton(mapView: mapView)
        compass.compassVisibility = .visible
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: compass)
        mapView.showsCompass = true
    }
    
    func setupUserTrackingButtonAndScaleView() {
        mapView.showsUserLocation = true
        
        let button = MKUserTrackingButton(mapView: mapView)
        button.layer.backgroundColor = UIColor(white: 1, alpha: 0.8).cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        let scale = MKScaleView(mapView: mapView)
        scale.legendAlignment = .trailing
        scale.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scale)
        
        NSLayoutConstraint.activate([button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                                     button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                                     scale.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10),
                                     scale.centerYAnchor.constraint(equalTo: button.centerYAnchor)])
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
    
    override func viewWillAppear(_ animated: Bool) {
        print("Remzi:  WelcomeFirstPinViewController viewWillAppear girdi")
        super.viewWillAppear(animated)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("LocationManager Starts.......")
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LATITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees, longitudeDelta: ConstantsForLocationParameters.WelcomeFirstPinControllerLocationConstants.LONGITUDE_DELTA_DEGREE_0_002 as CLLocationDegrees)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        
        // add current location information to both userLocation object and pindata
        pinDataObject.location.setCurrentLocation(locationCoordinate: location)
        
    }
    
    @IBAction func dropPinButtonTapped(_ sender: UIButton) {
       
        print("dropPinButtonTapped starts")
        print("user.isUserGetInformedFromGuidance4 : \(user.isUserGetInformedFromGuidance4)")
        print("mainPinDropButtonTapped : \(mainPinDropButtonTapped)")
        
        
        if isMainButtonPinDropOrConfirmationButton() {
            
            doTheAnimationForConfirmationButtons()
            
            
        } else {
            
            if user.isUserGetInformedFromGuidance4 {
                
                doTheAnimationForSpecificPinDropButtons()
                
            } else {
                
                goToGuidanceStep4()
            }
            
        }
        
        
        /*
        if pinDataObject.isPinDropped {
            
            print("check1")
            
            takasi()
            
        } else {
            
            print("check2")
            
            if user.isUserGetInformedFromGuidance4 {
                
                doTheAnimation()
                
            } else {
                
                goToGuidanceStep4()
                
            }
            
        }*/
        
    }
    
    func goToGuidanceStep4() {
        
        print("goToGuidanceStep4 starts")
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "guidance_step4_ViewController_storyBoardID") as? guidance_step4_ViewController {
            
            destinationViewController.tempMapView = self.mapView
            destinationViewController.tempUser = self.user
            destinationViewController.tempPinData = self.pinDataObject
            destinationViewController.tempAnnotation = self.annotation
            
            destinationViewController.allFriendButtonCenter = self.allFriendButtonCenter
            destinationViewController.onlyMeButtonCenter = self.onlyMeButtonCenter
            destinationViewController.specialButtonCenter = self.specialButtonCenter
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
    
    func dropPinOnMap() {
        
        checkPinDataUploadedToDatabase()
        
        if !pinDataObject.isPinDropped {
            addPinAnnotation(for: pinDataObject.location.currenLocation)
            
            pinDataObject.isPinDropped(inputBooleanValue: true)
            
        }
        
    }
    
    func checkPinDataUploadedToDatabase() {
        
        if pinDataObject.isPinDropped && !pinDataObject.isPinDataUploadedDatabase {
        
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
            let alertAppearance = SCLAlertView.SCLAppearance()
        
            let alertView = SCLAlertView(appearance: alertAppearance)
        
            alertView.showWarning("Uyarı", subTitle: "Lütfen bırakılan pin kaydediniz veya siliniz!", closeButtonTitle: "OK")
        }
        
    }
    
    func addPinAnnotation(for coordinate: CLLocationCoordinate2D) {
        
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                self.annotation = PersonAnnotation(inputPinData: self.pinDataObject)
                self.setParsedLocationData(inputPlaceMark: placemark)
                
                self.mapView.addAnnotation(self.annotation)
                
                //self.mapView.selectedAnnotations.append(self.annotation)
                
                self.mapView.selectAnnotation(self.annotation, animated: true)
            }
        }
    }
    
    // MARK: - MKMapViewDelegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("Remzi: WelcomeFirstPinViewController mapView girdi")
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kPersonAnnotationName)
        
        if annotationView == nil {
            print("annotation nil")
            annotationView = PersonAnnotationView(annotation: annotation, reuseIdentifier: kPersonAnnotationName)
            (annotationView as! PersonAnnotationView).personDetailDelegate = self
            
            // user burada set edilerek update edilmeli güncel location bilgileri için
            (annotationView as! PersonAnnotationView).customCalloutView?.person = user
        } else {
            print("annotation dolu")
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            print("Device was shaken")
            if !self.pinDataObject.location.isPinDropped {
                addPinAnnotation(for: self.pinDataObject.location.currenLocation)
                // current location alındığı bilgisi set edilir
                self.pinDataObject.location.setIsPinDropped(isPinDropped: true)
            }
        }
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "goToMainHomePageFromNextButton", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoGuidance" {
            if let guidance_1 = segue.destination as? guidance_step1_ViewController {
                guidance_1.user = user
            }
        }
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
                        //self.cameraButton.setImage(image, for: .normal)
                        self.buttonOnlyMe.setImage(image, for: .normal)
                        //self.pinDataObject.setPictureOnPin(inputPictureOnPin: image!)
                    
                    } catch {
                        
                        print("boku yedik")
                        
                    }
                }
            })
        }
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
    
    /*
    func okRequestForPerson(pinData : PinData) {
        print("Remzi: ok click")
        self.savePinDataToFirebase()
        hideSelectedDropPinButton()
        showAlert()
        
        
    }*/
    
    
    /*
        red button on pin to delete everthing related to pin data, and marker itself dropped on map
     */
    /*
    func cancelRequestForPerson(pinData : PinData) {
        print("Remzi: cancel click")
        print("count : \(self.mapView.annotations.count)")
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton(ConstantStrings.ButtonTitles.STRING_OK) {
            
            self.mapView.removeAnnotation(self.mapView.selectedAnnotations.last!)
            
            self.pinDataObject.resetPinDataFlags()
            self.pinDropObjects.resetClickedInfo()
            //self.setAdditionalPinButtonBehindTheMain()
            
            self.resetDropPinCenter()
            
            self.mainPinDropButtonTapped = false
            
            self.buttonMainDropPin.setImage(UIImage(named: ConstantDefaultImages.MapAnnotation.MAIN_DROP_PIN_BUTTON_IMAGE), for: .normal)
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_DATA_ON_PIN_GET_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
        
        
    }*/
    
    /*
        to add text, note whatever a person writes on dropped pin on
     */
    func addTextRequestForPerson(pinData : PinData) {
        print("Remzi: addTextRequestForPerson")
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "PinTextDataViewController_storyBoardID") as? PinTextDataViewController {
            
            print("erkut2")
            
            //destinationViewController.pinDataImage.image = pinDataObject.pictureOnPin
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.tempMapView = self.tempMapView
            
            present(destinationViewController, animated: true, completion: {
                print("gidiyoruz :)")
            })
        }
        
    }
    
    /*
        to add a special video on dropped pin on map
     */
    func addVideoRequestForPerson(pinData : PinData) {
        print("Remzi: addVideoRequestForPerson")
        
        if self.pinDataObject.videoExistFlag {
            
            self.startGettingVideoProcess()
            
        } else {
            
            self.informationForVideoData()
            
        }
        
    }
    
    /*
        to add image on dropped pin on map
     */
    func addImageRequestForPerson(pinData : PinData) {
        print("Remzi: addImageRequestForPerson")
        print("pinData.isPictureExist :\(pinData.isPictureExist)")
        print("pinDataObject.isPictureExist :\(pinDataObject.isPictureExist)")
        
        if pinDataObject.isPictureExist {
            
            print("erkut1")
            
            
            if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "PinDataPictureViewController_storyBoardID") as? PinDataPictureViewController {
                
                print("erkut2")
                
                //destinationViewController.pinDataImage.image = pinDataObject.pictureOnPin
                
                destinationViewController.pinDataObject = self.pinDataObject
                destinationViewController.tempMapView = self.tempMapView
                
                // tell destination view where it is being called
                destinationViewController.callerView = ViewControllerEnums.WelcomeFirstPin
                
                present(destinationViewController, animated: true, completion: {
                    print("gidiyoruz :)")
                })
                
            }
            
        } else {
            
            self.decideHowProfilePictureLoads()
        }
        
    }
    
    func gotoGuidanceStep3() {
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "guidance_step3_ViewController_storyBoardID") as? guidance_step3_ViewController {
            
            destinationViewController.tempMapView = self.mapView
            destinationViewController.tempUser = self.user
            destinationViewController.tempPinData = self.pinDataObject
            destinationViewController.tempAnnotation = self.annotation
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func decideFlowWhenDropPinButtonsClicked() {
        
        if user.isUserGetInformedFromGuidence {
            
            dropPinOnMap()
            
        } else {
            
            gotoGuidanceStep3()
            
        }
        
    }
    
    func yarro(completion: (_ result: String) -> Void) {
        
        print("yarro starts")
        pinDropObjects.pinButtonAllFriendsClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.pinDropObjects.centerInfoForSelectedButton
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            
        }
        
        decideFlowWhenDropPinButtonsClicked()
        
        completion("yarrox")
        
    }
    
    func startAnimateForButtonAllFriends(completion: (_ result: Bool) -> Void) {
        
        print("startAnimateForButtonAllFriends starts")
        pinDropObjects.pinButtonAllFriendsClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            
        }
        
        decideFlowWhenDropPinButtonsClicked()
        
        completion(true)
        
    }
    
    func startAnimateForButtonOnlyMe(completion: (_ result: Bool) -> Void) {
        
        print("startAnimateForButtonOnlyMe starts")
        pinDropObjects.pinButtonOnlyMeClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            
        }
        
        decideFlowWhenDropPinButtonsClicked()
        
        completion(true)
        
    }
    
    func startAnimateForButtonSpecial(completion: (_ result: Bool) -> Void) {
        
        print("startAnimateForButstartAnimateForButtonSpecialtonAllFriends starts")
        pinDropObjects.pinButtonSpecialPersonOrGroupClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            
        }
        
        decideFlowWhenDropPinButtonsClicked()
        
        completion(true)
        
    }
    
    @IBAction func allFriendsDropPinClicked(_ sender: Any) {
        
        startAnimateForButtonAllFriends { (result) in
            
            if result {
                
                self.buttonMainDropPin.setImage(self.buttonAllFriends.currentImage, for: .normal)
                
                doTheAnimationForConfirmationButtons()
                
            }
            
        }
        
        /*
        pinDropObjects.pinButtonAllFriendsClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.pinDropObjects.centerInfoForSelectedButton
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            
        }
        
        decideFlowWhenDropPinButtonsClicked()*/
        
    }
    
    @IBAction func onlyMeDropPinClicked(_ sender: Any) {
        
        startAnimateForButtonOnlyMe { (result) in
            
            if result {
                
                self.buttonMainDropPin.setImage(self.buttonOnlyMe.currentImage, for: .normal)
                
                doTheAnimationForConfirmationButtons()
                
            }
        }
        
        /*
        pinDropObjects.pinButtonOnlyMeClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonOnlyMe.center = self.pinDropObjects.centerInfoForSelectedButton
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            
            
            
        }
        
        decideFlowWhenDropPinButtonsClicked()*/
        
    }
    
    @IBAction func specificPersonOrGroupDropPinClicked(_ sender: Any) {
        
        startAnimateForButtonSpecial { (result) in
            
            if result {
                
                self.buttonMainDropPin.setImage(self.buttonSpecialFriends.currentImage, for: .normal)
                
                doTheAnimationForConfirmationButtons()
                
            }
            
        }
        
        /*
        pinDropObjects.pinButtonSpecialPersonOrGroupClicked = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonSpecialFriends.center = self.pinDropObjects.centerInfoForSelectedButton
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            
        }
        
        decideFlowWhenDropPinButtonsClicked()*/
        
    }
    
    func setAdditionalPinButtonBehindTheMain() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            
        }
        
    }
    
    func resetDropPinCenter() {
        
        print("resetDropPinCenter starts")
        print("onlyMe : \(pinDropObjects.pinButtonOnlyMe)")
        print("allFriends :\(pinDropObjects.pinButtonAllFriends)")
        print("special : \(pinDropObjects.pinButtonSpecialPersonOrGroup)")
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonAllFriends.center = self.buttonMainDropPin.center
            self.buttonSpecialFriends.center = self.buttonMainDropPin.center
            self.buttonOnlyMe.center = self.buttonMainDropPin.center
            self.buttonDeletePinData.center = self.buttonMainDropPin.center
            self.buttonConfirmPinData.center = self.buttonMainDropPin.center
            
        }
        
        
    }
    
    func takasi() {
        
        print("takasi starts")
        print("mainPinDropButtonTapped : \(mainPinDropButtonTapped)")
        print("self.pinDropObjects.centerInfoForSelectedButton : \(self.pinDropObjects.centerInfoForSelectedButton)")
        print("self.buttonMainDropPin.center : \(self.buttonMainDropPin.center)")
        
        print("pinButtonOnlyMeClicked : \(pinDropObjects.pinButtonOnlyMeClicked)")
        print("pinButtonSpecialPersonOrGroupClicked : \(pinDropObjects.pinButtonSpecialPersonOrGroupClicked)")
        print("pinButtonAllFriendsClicked : \(pinDropObjects.pinButtonAllFriendsClicked)")
        
        if !mainPinDropButtonTapped {
            
            print("erkut1")
            if pinDropObjects.pinButtonOnlyMeClicked {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.buttonOnlyMe.center = self.pinDropObjects.centerInfoForSelectedButton
                    
                }
                
            }
            
            if pinDropObjects.pinButtonSpecialPersonOrGroupClicked {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.buttonSpecialFriends.center = self.pinDropObjects.centerInfoForSelectedButton
                    
                }
                
            }
            
            if pinDropObjects.pinButtonAllFriendsClicked {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.buttonAllFriends.center = self.pinDropObjects.centerInfoForSelectedButton
                    
                }
                
            }
            
            mainPinDropButtonTapped = true
            
            
        } else {
            
            print("erkut2")
            if pinDropObjects.pinButtonOnlyMeClicked {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.buttonOnlyMe.center = self.buttonMainDropPin.center
                    
                }
                
            }
            
            if pinDropObjects.pinButtonSpecialPersonOrGroupClicked {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.buttonSpecialFriends.center = self.buttonMainDropPin.center
                    
                }
                
            }
            
            if pinDropObjects.pinButtonAllFriendsClicked {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.buttonAllFriends.center = self.buttonMainDropPin.center
                    
                }
                
            }
            
            mainPinDropButtonTapped = false
        }
        
    }
    
    func hideSelectedDropPinButton() {
        
        if pinDropObjects.pinButtonOnlyMeClicked {
            
            UIView.animate(withDuration: 0.3) {
                
                self.buttonOnlyMe.center = self.buttonMainDropPin.center
                
            }
            
        }
        
        if pinDropObjects.pinButtonSpecialPersonOrGroupClicked {
            
            UIView.animate(withDuration: 0.3) {
                
                self.buttonSpecialFriends.center = self.buttonMainDropPin.center
                
            }
            
        }
        
        if pinDropObjects.pinButtonAllFriendsClicked {
            
            UIView.animate(withDuration: 0.3) {
                
                self.buttonAllFriends.center = self.buttonMainDropPin.center
                
            }
            
        }
        
        mainPinDropButtonTapped = false
        
    }
    
    @IBAction func cancelPinDropProcess(_ sender: Any) {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton(ConstantStrings.ButtonTitles.STRING_OK) {
            
            self.mapView.removeAnnotation(self.mapView.selectedAnnotations.last!)
            
            self.pinDataObject.resetPinDataFlags()
            self.pinDropObjects.resetClickedInfo()
            //self.setAdditionalPinButtonBehindTheMain()
            
            self.resetDropPinCenter()
            
            self.mainPinDropButtonTapped = false
            
            self.buttonMainDropPin.setImage(UIImage(named: ConstantDefaultImages.MapAnnotation.MAIN_DROP_PIN_BUTTON_IMAGE), for: .normal)
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_DATA_ON_PIN_GET_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
        
    }
    
    @IBAction func savePinDropData(_ sender: Any) {
        
        print("Remzi: ok click")
        self.savePinDataToFirebase()
        hideSelectedDropPinButton()
        showAlert()
        
    }
    
}


