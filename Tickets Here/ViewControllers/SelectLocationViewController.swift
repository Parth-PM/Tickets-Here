//
//  SelectLocationViewController.swift
//  Tickets Here
//
//  Created by Parth Maru on 2023-04-16.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

class SelectLocationViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    let manager = CLLocationManager()
    
    //Cineplex scarborough longtitude and latitude
    //43.775843, -79.255777
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*  let annotation = MKPointAnnotation()
         annotation.coordinate = CLLocationCoordinate2D(latitude: 43.775843, longitude: -79.255777)
         annotation.title = "Cineplex Cinemas Scarborough"
         mapView.addAnnotation(annotation)
         
         let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
         mapView.setRegion(region, animated: true)*/
        
        createAnnotations(locations: annotationLocations)
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest //battery
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region , animated: true)
    }
    
        let annotationLocations = [
            ["title": "Cineplex Cinemas Scarborough Mall", "latitude":43.775843, "longitude":-79.255777],
            ["title": "Cineplex Cinemas Fairview Mall", "latitude":43.778530, "longitude":-79.344168],
            ["title": "Cineplex Cinemas Fairview Mall", "latitude":43.810149, "longitude":-79.269421]
        ]
        
        func createAnnotations(locations: [[String: Any]]){
            for location in locations {
                let annotations = MKPointAnnotation()
                annotations.title = location["title"] as? String
                annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
                mapView.addAnnotation(annotations)
            }
            
        }
    
    
}
