//
//  LocationManager.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocationCoordinate2D?
    @Published var isNonAuthorised: Bool = true
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestAccess() {
        manager.requestAlwaysAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        isNonAuthorised = !(manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}
