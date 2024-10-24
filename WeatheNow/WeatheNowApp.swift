//
//  WeatheNowApp.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

@main
struct WeatheNowApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
//    @StateObject var locationManager = LocationManager.shared

    var body: some Scene {
        WindowGroup {
            Group {
                if isFirstLaunch {
                    OnboardingView()
                } else {
                    ContentView()
                        .onAppear {
                            // TODO: locationManager.requestAccess()
                        }
                }
            }
        }
    }
}
