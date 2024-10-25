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

            //TODO: view
            VStack(spacing: 20) {
                Text("The WeatherNow App has no right")
                    .bold()
                    .font(.title)

                Text("Please, give a permission of your Location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

//#Preview {
//    ContentView()
////        .environment(LocationDataManager())
//}
