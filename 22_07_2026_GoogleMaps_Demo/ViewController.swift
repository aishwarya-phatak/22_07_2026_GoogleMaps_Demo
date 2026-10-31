//
//  ViewController.swift
//  22_07_2026_GoogleMaps_Demo
//
//  Created by Vishal Jagtap on 31/10/26.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    var mapView : GMSMapView?
    var gmsPuneMarker : GMSMarker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewInitialSettings()
        initViews()
    }
    
    func initViews(){
        let clllocationCordinateForPune = CLLocationCoordinate2D(
            latitude: 18.516726,
            longitude: 73.856255)
        
        let gmsCamera = GMSCameraPosition(target: clllocationCordinateForPune, zoom: 20.0)
        
        gmsPuneMarker = GMSMarker(position: clllocationCordinateForPune)
        
        let gmsMapViewOptions = GMSMapViewOptions()
        gmsMapViewOptions.camera = gmsCamera
        gmsMapViewOptions.frame = self.view.frame
        
        mapView = GMSMapView(options: gmsMapViewOptions)
        self.view = mapView
        
        gmsPuneMarker?.map = mapView
        markerSettings(marker: gmsPuneMarker!)
    }
    
    func mapViewInitialSettings(){
        mapView?.settings.myLocationButton = true
        mapView?.settings.rotateGestures = true
        mapView?.settings.scrollGestures = true
        mapView?.settings.tiltGestures = true
        mapView?.isMyLocationEnabled = true
        mapView?.mapType = .normal
        mapView?.isBuildingsEnabled = true
        mapView?.isTrafficEnabled = true
        mapView?.isMyLocationEnabled = true
    }
    
    func markerSettings(marker : GMSMarker){
        marker.isDraggable = true
        marker.rotation = 45.0
        marker.title = "Pune City"
        marker.snippet = "There is a long history associated with this City!"
    }
}
