//
//  WeatheNowApp.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

@main
struct WeatherNowApp: App {
    @StateObject private var locationManager = LocationDataManager()

    var body: some Scene {
        WindowGroup {
            Group {
                ContentView()
            }
            .environmentObject(locationManager)
        }
    }
}
