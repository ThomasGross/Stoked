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
    
    @IBOutlet weak var locationActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var SideMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var MapView: MKMapView!
    
    @IBOutlet weak var calloutButton: UIButton!
    
    @IBAction func calloutbuttonAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueToDetailView", sender: self)
        
    }
    // Tells the whether or not to update userlocation
    var relocation : Bool = false
    
    // Delegate property for the locationmanager
    var locationManager = CLLocationManager()
    
    var jsonLocationService = JsonLocationService()
    
    var jsonWeatherService = JsonWeatherService()
    
    var locations: [LocationModel] = []
    
    var tempCalloutLocation: JSON?
    var tempLocation: LocationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationActivityIndicator.startAnimating()
        
        SideMenuButton.target = self.revealViewController()
        SideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        addAnnotations()
        
        
        // sets the delegate to be self
        locationManager.delegate = self
        
        // sets the delegate to be self
        MapView.delegate = self
        
        // set the disired location to be best possible
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // We only want to use locationmanager when the app is used
        locationManager.requestWhenInUseAuthorization()
        
        
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
        
        DispatchQueue.main.async {
            self.jsonLocationService.getLocations() { responceLocation in
                self.locations = responceLocation
                
                
                // loops though the list of mapitems in the response
                for location in self.locations {
                    if location.showLocation == true{
                        
                        let customAnnotation = CustomAnnotationModel()
                        
                        let locationCordinate = CLLocationCoordinate2D(latitude: location.locationLat, longitude: location.locationLong)
                        customAnnotation.locationId = location.locationId
                        customAnnotation.coordinate = locationCordinate // assign cordinate to the annotation
                        
                        self.MapView.addAnnotation(customAnnotation) // add the annotation to the map
                    }
                }
                
                self.locationActivityIndicator.stopAnimating()
                self.locationActivityIndicator.isHidden = true
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
        annotationView?.image = UIImage(named: "Location-Pin")
        return annotationView
    }
    
    
        // Drop pin animation
//    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
//        let visibleRect = mapView.annotationVisibleRect
//        
//        for view:MKAnnotationView in views{
//            let endFrame:CGRect = view.frame
//            var startFrame:CGRect = endFrame
//            startFrame.origin.y = visibleRect.origin.y - startFrame.size.height
//            view.frame = startFrame;
//            
//            UIView.beginAnimations("drop", context: nil)
//            
//            UIView.setAnimationDuration(1.5)
//            
//            view.frame = endFrame;
//            
//            
//            UIView.commitAnimations()
//        }
//    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // 1 First, the method will check whether the selected annotation is a user location related annotation, in such case, it will return without doing anything.
        if view.annotation is MKUserLocation
        {
            // Don't proceed with custom callout
            return
        }
        // 2
        let customAnnotation = view.annotation as! CustomAnnotationModel
        
        locationActivityIndicator.startAnimating()
        locationActivityIndicator.isHidden = false

        for location in locations {
            if location.locationId == customAnnotation.locationId  {
                
                tempLocation = location
                
                DispatchQueue.main.async {
                    self.jsonWeatherService.getWeatherForLocation(id: location.locationId) { responceLocation in
                        
                        self.locationActivityIndicator.stopAnimating()
                        self.locationActivityIndicator.isHidden = true
                        
                        let views = Bundle.main.loadNibNamed("CustomCalloutView", owner: nil, options: nil)
                        let calloutView = views?[0] as! CustomCalloutView
                        
                        
                        calloutView.getlocationDetails(location: location, json: responceLocation)
                        
                        self.tempCalloutLocation = responceLocation
                        
                        
                        self.calloutButton.isHidden = false
                        
                        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
                        
                        view.addSubview(calloutView)
                        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
                        
                    }
                }
            }
        }
 
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
        if view.isKind(of: CustomAnnotationViewModel.self)
        {
            for subview in view.subviews
            {
                self.calloutButton.isHidden = true
                subview.removeFromSuperview()
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
        if animated == false {
            self.calloutButton.isHidden = true
           
        }else {
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetailView" {
            if let vc = segue.destination as? LocationDetailViewController {
                vc.json = tempCalloutLocation
                vc.location = tempLocation
                let backItem = UIBarButtonItem()
                backItem.title = ""
                
                navigationItem.backBarButtonItem = backItem
                // to set image:
//                self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "wavedirection")
//                self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "wavedirection")
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
