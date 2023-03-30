//
//  ViewController.swift
//  hello-maps
//
//  Created by Mohammad Azam on 8/5/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView :MKMapView!
    private let locationManager = CLLocationManager()
    
    let annotationFactory = AnnotationFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
    }
  
    @IBAction func showYelpSuggestionsButtonPressed() {
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var businessAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "BusinessAnnotationView")
        
        if businessAnnotationView == nil {
            
            let businessVM = annotation as! BusinessViewModel
            
            businessAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "BusinessAnnotationView")
            businessAnnotationView?.canShowCallout = true
            businessAnnotationView?.image = businessVM.image 
            
        } else {
            businessAnnotationView?.annotation = annotation
        }
        
        return businessAnnotationView
        
    }
    
   
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        
        mapView.setRegion(region, animated: true)
    }
    

}

