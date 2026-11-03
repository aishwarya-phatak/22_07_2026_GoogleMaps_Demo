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
    var clLocationCordinateForPune : CLLocationCoordinate2D?
    var clLocationCoordinateForMumbai : CLLocationCoordinate2D?
    var clLocationCoordinateForNashik : CLLocationCoordinate2D?
    var gmsPuneMarker : GMSMarker?
    var gmsMumbaiMarker : GMSMarker?
    var gmsNashikMarker : GMSMarker?
    
    var gmsCircle : GMSCircle?
    var gmsPolygon : GMSPolygon?
    var gmsPolyline : GMSPolyline?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewInitialSettings()
        initViews()
        
        drawCircleOnMap()
        drawPolygonOnMap()
        drawPolylineOnMap()
    }
    
    func initViews(){
        clLocationCordinateForPune = CLLocationCoordinate2D(
            latitude: 18.516726,
            longitude: 73.856255)
        
        let gmsCamera = GMSCameraPosition(target: CLLocationCoordinate2D(
            latitude: 19.66, longitude: 75.13), zoom: 10.0)
        
        gmsPuneMarker = GMSMarker(position: clLocationCordinateForPune!)
        
        let gmsMapViewOptions = GMSMapViewOptions()
        gmsMapViewOptions.camera = gmsCamera
        gmsMapViewOptions.frame = self.view.frame
        
        mapView = GMSMapView(options: gmsMapViewOptions)
        self.view = mapView
        
        gmsPuneMarker?.map = mapView
        
        markerSettings(marker: gmsPuneMarker!,
                       markerTitle: "Pune City",
                       markerSnippet: "This is Pune City and I love it!")
        
        clLocationCoordinateForMumbai = CLLocationCoordinate2D(latitude: 19.076090,
                                                               longitude: 72.877426)
        
        gmsMumbaiMarker = GMSMarker(position: clLocationCoordinateForMumbai!)
        markerSettings(marker: gmsMumbaiMarker!,
                       markerTitle: "Mumbai City",
                       markerSnippet: "City of Dreams!")
        
        clLocationCoordinateForNashik = CLLocationCoordinate2D(latitude: 19.9973,
                                                               longitude: 73.799)
        
        gmsNashikMarker = GMSMarker(position: clLocationCoordinateForNashik!)
        markerSettings(marker: gmsNashikMarker!,
                       markerTitle: "Nashik City",
                       markerSnippet: "City of God!")
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
    
    func markerSettings(marker : GMSMarker, markerTitle : String, markerSnippet : String){
        marker.isDraggable = true
        marker.rotation = 0.0
        marker.title = "\(markerTitle)"
        marker.snippet = "\(markerSnippet)"
    }
    
    func drawCircleOnMap(){
        gmsCircle = GMSCircle(position: clLocationCordinateForPune!, radius: 30.0)
        gmsCircle?.fillColor = .cyan
        gmsCircle?.strokeColor = .brown
        gmsCircle?.strokeWidth = 10.0
        gmsCircle?.map = mapView
    }
    
    func drawPolygonOnMap(){
        let gmsMutablePath = GMSMutablePath()
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 17.688, longitude: 84.006))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 17.671, longitude: 75.9104))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 17.525, longitude: 76.205))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 16.8543, longitude: 74.5641))
        
        gmsPolygon = GMSPolygon(path: gmsMutablePath)
        gmsPolygon?.strokeColor = .black
        gmsPolygon?.strokeWidth = 20.0
        gmsPolygon?.fillColor = .lightGray
        
        gmsPolygon?.map = mapView
    }
    
    func drawPolylineOnMap(){
        let gmsMutablePath = GMSMutablePath()
        
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 19.66, longitude: 75.13))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 22.385, longitude: 71.31))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 27.39, longitude: 73.43))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 26.13, longitude: 82.48))
        gmsMutablePath.add(CLLocationCoordinate2D(latitude: 19.66, longitude: 75.13))
    
        gmsPolyline = GMSPolyline(path: gmsMutablePath)
        gmsPolyline?.strokeColor = .blue
        gmsPolyline?.strokeWidth = 20.0
        
        gmsPolyline?.map = mapView
    }
}

extension ViewController : GMSMapViewDelegate{
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("didTapMyLocationButton method has been called")
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("didTap method has been called")
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("didTap At method has been called")
        print(coordinate.latitude," -- ",coordinate.longitude)
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf method has been called")
        print(marker.position)
    }
    
//    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
////        print("markerInfoContents method has been called")
//    }
//   
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging method has been called")
        print(marker.position)
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag method has been called")
        print(marker.position)
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging method has been called")
        print(marker.position)
    }
    
    
}
