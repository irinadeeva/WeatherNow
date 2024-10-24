//
//  WeatheNowApp.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

@main
struct WeatherNowApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @StateObject var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            Group {
                if isFirstLaunch {
                    OnboardingView()
                } else {
                    ContentView()
                        .onAppear {
                            locationManager.requestAccess()
                        }
                }
            }
            .environmentObject(locationManager)
        }
    }
}
