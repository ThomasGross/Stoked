//
//  ViewController.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 10/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var SideMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var MapView: MKMapView!
    
    // Tells the whether or not to update userlocation
    var relocation : Bool = false
    
    // Delegate property for the locationmanager
    var locationManager = CLLocationManager()
    
    var jsonLocationService = JsonLocationService()
    
    var locations: [LocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SideMenuButton.target = self.revealViewController()
        SideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        DispatchQueue.main.async {
            self.jsonLocationService.getLocations() { responceLocation in
                self.locations = responceLocation
                print(responceLocation[0].locationName)
                // todo
                // add annotation placer method here
                self.addAnnotations()
                
            }
        }
        
        
        // sets the delegate to be self
        locationManager.delegate = self
        
        // sets the delegate to be self
        MapView.delegate = self
        
        // set the disired location to be best possible
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // We only want to use locationmanager when the app is used
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // called when the region is changed - only in the start of the app because of relocation if statement
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        if relocation {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            
            // method that start looking for a location
            locationManager.startUpdatingLocation()
            print("started updating map")
            MapView.showsUserLocation = true
            relocation = true
            
            
        default:
            locationManager.stopUpdatingLocation()
            print("stopped updating map")
            MapView.showsUserLocation = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.last{  // optional binding
            
            let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate,100000,100000)
            
            self.MapView.setRegion(region, animated: true) //vis området på kortet
        }
        
        if relocation{
            locationManager.stopUpdatingLocation()
            relocation = false
        }
        
    }
    
    func addAnnotations() {
        
        // loops though the list of mapitems in the response
        for location in locations {
            if location.showLocation == true{
                // data testing
                print("Name = \(location.locationName)")
                print(location.creationDate)
                print(location.locationDescription)
                print(location.showLocation)
                
                
                let customAnnotation = CustomAnnotationModel()
                
                let locationCordinate = CLLocationCoordinate2D(latitude: location.locationLat, longitude: location.locationLong)
                customAnnotation.locationId = location.locationId
                customAnnotation.coordinate = locationCordinate // assign cordinate to the annotation
                
                self.MapView.addAnnotation(customAnnotation) // add the annotation to the map
            }
        }
    }
    
    //MARK: MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation
        {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin") as? CustomAnnotationViewModel
        
        if annotationView == nil{
            
            annotationView = CustomAnnotationViewModel(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = false
            
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "More")
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // 1
        if view.annotation is MKUserLocation
        {
            // Don't proceed with custom callout
            return
        }
        // 2
        let customAnnotation = view.annotation as! CustomAnnotationModel
        
        let views = Bundle.main.loadNibNamed("CustomCalloutView", owner: nil, options: nil)
        let calloutView = views?[0] as! CustomCalloutView
        
        calloutView.layer.cornerRadius = 5;
        
        calloutView.layer.shadowColor = UIColor.black.cgColor
        calloutView.layer.shadowOpacity = 0.5
        calloutView.layer.shadowOffset = CGSize.zero
        calloutView.layer.shadowRadius = 5
        
        for location in locations {
            if location.locationId == customAnnotation.locationId  {
                
                calloutView.locationName.text = location.locationName
                
                calloutView.locationCategories.text = ""
                if (location.isSurfLocation == true){
                    calloutView.locationCategories.text?.append("SURF")
                }
                if (location.isSUPLocation == true){
                    if calloutView.locationCategories.text != "" {
                        calloutView.locationCategories.text?.append(" · ")
                    }
                    calloutView.locationCategories.text?.append("SUP")
                }
                if (location.isWhiteWaterLocation == true){
                    if calloutView.locationCategories.text != "" {
                        calloutView.locationCategories.text?.append(" · ")
                    }
                    calloutView.locationCategories.text?.append("WHITE WATER")
                }
                
                calloutView.locationCurrentConditions.text = location.locationDescription
                
            }
        }
        
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: CustomAnnotationViewModel.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

