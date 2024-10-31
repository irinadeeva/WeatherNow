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

    var body: some View {

        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                if let weather = viewModel.weather {
                    WeatherDataView(weather: weather)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.accent)
        .preferredColorScheme(.dark)
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
        //TODO: handle error
        .alert(isPresented: $locationManager.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(verbatim: locationManager.locationErrorMessage ?? "Unknown error"),
                primaryButton: .default(Text("Try again")) {
                    locationManager.showAlert = false
                    getWeatherData()
                },
                secondaryButton: .cancel() {
                    locationManager.showAlert = false
                })
        }
        .onAppear {
            getWeatherData()
        }
    }

    private func getWeatherData() {
        locationManager.fetchCoordinate()

        if let location = locationManager.coordinate {
            viewModel.fetchWeather(at: Coordinates(latitude: location.latitude,
                                                   longitude: location.longitude))
        }

        locationManager.stopMonitoring()
    }
}
