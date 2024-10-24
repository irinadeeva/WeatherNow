//
//  Weather.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()
    @EnvironmentObject var locationManager: LocationManager

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

        }
        .padding()
        .onAppear {
            //TODO: send location from LocationManager to fetchWeather()
            if let location = locationManager.location {
                viewModel.fetchWeather(location.latitude, location.longitude)
            }
        }
    }
}
//
//#Preview {
//    WeatherView()
//}
