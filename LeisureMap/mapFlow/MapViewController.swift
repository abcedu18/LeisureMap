//
//  MapViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate{

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager=CLLocationManager()
    let regionRadius:CLLocationDistance=1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view.
        mapView.delegate=self
        mapView.showsUserLocation=true
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager.delegate=self
            locationManager.desiredAccuracy=kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        let flag=MapFlag(title: "ios App by Swift", locationName: "安徽商贸学院", discipline: "Apple Room", coordinate: CLLocationCoordinate2D(latitude: 31.29165118, longitude: 118.367044), url: "https://apple.com")
        mapView.addAnnotation(flag)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func centerMapOnLocation(location : CLLocation){
        let coordinateRegion = MKCoordinateRegion(center:location.coordinate,latitudinalMeters:regionRadius,longitudinalMeters:regionRadius)
        mapView.setRegion(coordinateRegion,animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue:CLLocationCoordinate2D=manager.location?.coordinate else {
            return
        }
        print("latitude:\(locValue.latitude):longitude:\(locValue.longitude)")
        centerMapOnLocation(location: manager.location!)
    }
    
    @objc func moveToWebView(sender:UIButton){
        print("moveToWebViewa")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapFlag else {
            return nil
        }
        let identifer="marker"
        let annotationView :MKAnnotationView
        
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifer) as? MKMarkerAnnotationView{
            dequeueView.annotation = annotation
            annotationView=dequeueView
            
        }else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifer)
            annotationView.canShowCallout = true
            annotationView.calloutOffset=CGPoint(x:-5,y:5)
            let button = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = button
            
            button.addTarget(self, action:#selector(self.moveToWebView(sender:)), for:.touchUpInside)
            
        }
         return annotationView
    }
   

}
