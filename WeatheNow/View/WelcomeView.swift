//
//  WeclomeView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 25/10/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject private var locationManager: LocationDataManager

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the WeatherNow App")
                    .bold()
                    .font(.title)

                Text("Please share your location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()

            LocationButton(.shareMyCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
