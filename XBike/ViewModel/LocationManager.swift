//
//  LocationManager.swift
//  XBike
//
//  Created by Rafael Martins on 31/03/25.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var isTracking = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func toggleTracking() {
        isTracking.toggle()
    }
}
