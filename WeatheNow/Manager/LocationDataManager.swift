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
    @Published var locationErrorMessage: String? = nil
    @Published var showAlert = false
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
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

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        if let clError = error as? CLError {
            switch clError.code {
            case .locationUnknown:
                locationErrorMessage = "Location unknown. Please try again."
            case .denied:
                locationErrorMessage = "Location access denied. Please check permissions."
            case .network:
                locationErrorMessage = "Network error. Please check your internet connection."
            case .deferredFailed:
                locationErrorMessage = "Location deferred request failed."
            default:
                locationErrorMessage = "Unexpected error: \(error.localizedDescription)"
            }
            showAlert = true
        } else {
            locationErrorMessage = "Unknown error: \(error.localizedDescription)"
        }
    }
}
