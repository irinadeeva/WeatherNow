//
//  ContentView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationDataManager()

    var body: some View {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            WeatherView(locationManager: locationManager)
        } else {
            Text("Please, give a permission of your Location")
        }
    }
}

//#Preview {
//    ContentView()
//        .environment(LocationManager())
//}
