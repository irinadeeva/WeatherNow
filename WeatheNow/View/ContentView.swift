//
//  ContentView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    //EnvironmentObject var locationManager: LocationManager

    var body: some View {
// TODO: handle yes/no for request Location
//        if !locationIsgiven {
//
//        } else
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
        .onAppear {
            //TODO: send location from LocationManager to fetchWeather()
            viewModel.fetchWeather()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
