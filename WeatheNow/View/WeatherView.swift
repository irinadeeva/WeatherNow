//
//  Weather.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @ObservedObject var locationManager: LocationDataManager

    var body: some View {

        // TODO: handle loading else {
        // ProgressView()
        // }
        // TODO: handle error

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

            VStack {
                if let location = locationManager.coordinate {
                    Text("Your location: \(location.latitude), \(location.longitude)")
                        }

                    }

        }
        .padding()
        .onAppear {
            locationManager.fetchCoordinate()

            if let location = locationManager.coordinate {
                viewModel.fetchWeather(at: location)
            }

            locationManager.stopMonitoring()
        }
    }
}
//
//#Preview {
//    WeatherView()
//}
