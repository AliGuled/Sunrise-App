//
//  Location.swift
//  Sunrise
//
//  Created by Guled Ali on 4/9/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
class Location: NSObject, CLLocationManagerDelegate {
    
    //Location manager
    let locationManager = CLLocationManager()
  
  //  var geoCoder =  CLGeocoder()
    var city: String = "????"
    
    //delegate
    var delegate:SunDelegate!
    
    init(delegate: SunDelegate) {
        self.delegate = delegate
    }
    
    override init() {
        super.init()
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
      
    }

    //Updating locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locations.first != nil {
            let userLocation:CLLocation = locations.first!
                self.locationManager.stopUpdatingLocation()

           
            
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks, error)-> Void in
                if placemarks != nil{
                    if placemarks!.count > 0{
                        let placemark = placemarks![0]
                        
                            self.city = placemark.locality!
                        

                    }
                }
            })
        }
    }
    
    //Printing errors with did fail with error method
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    //Responding status changes and respond only when augthrized whe in use
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
                self.locationManager.requestLocation()

            
        }
    }
    
    //Getting the city
    func getCity()->String{
        self.delegate.locations(locations:self.city)
        return city
    }
    
    
}
