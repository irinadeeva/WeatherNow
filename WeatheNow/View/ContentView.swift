//
//  ContentView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @EnvironmentObject private var locationManager: LocationDataManager

    var body: some View {
        if locationManager.authorizationStatus == .notDetermined {
            WelcomeView()
        } else if locationManager.authorizationStatus == .authorizedWhenInUse {
            WeatherView()
        } else {
            NoPermissionView()
        }
    }
}
