//
//  Weather.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @EnvironmentObject private var locationManager: LocationDataManager
    @State private var city: String = ""

    var body: some View {

        VStack {
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()

            Text(viewModel.temperature)
                .font(.system(size: 60))
                .bold()

            Text(viewModel.weatherDescription)
                .font(.title2)
                .padding()
        }
        .padding()
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(verbatim: viewModel.errorMessage ?? "Unknown error"),
                primaryButton: .default(Text("Try again")) {
                    viewModel.showAlert = false
                    if let location = locationManager.coordinate {
                        viewModel.fetchWeather(at: Coordinates(latitude: location.latitude,
                                                               longitude: location.longitude))
                    }
                },
                secondaryButton: .cancel() {
                    viewModel.showAlert = false
                })
        }
        .onAppear {
            locationManager.fetchCoordinate()

            if let location = locationManager.coordinate {
                viewModel.fetchWeather(at: Coordinates(latitude: location.latitude,
                                                       longitude: location.longitude))
            }

            locationManager.stopMonitoring()
        }
    }
}
