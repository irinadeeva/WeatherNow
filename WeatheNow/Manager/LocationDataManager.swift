//
//  LocationManager.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import CoreLocation

final class LocationDataManager: NSObject, ObservableObject {
    @Published var coordinate: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus?
    let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
    }

    func fetchCoordinate() {
        coordinate = locationManager.location?.coordinate
    }

    func stopMonitoring() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationDataManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
            self.locationManager.startUpdatingLocation()
            break

        case .restricted:
            authorizationStatus = .restricted
            break

        case .denied:
            authorizationStatus = .denied
            break

        case .notDetermined:
            authorizationStatus = .notDetermined
            break

        default:
            break
        }
    }
}
