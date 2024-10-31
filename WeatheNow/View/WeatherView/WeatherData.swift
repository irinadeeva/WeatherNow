//
//  WeatherData.swift
//  WeatheNow
//
//  Created by Irina Deeva on 30/10/24.
//

import SwiftUI

struct WeatherDataView: View {
    let weather: WeatherData
    @State private var showSheet = true

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(weather.name)
                    .bold()
                    .font(.title)

                Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack {
                VStack {

                    Text(weather.main.temp.roundDouble() + "°C")
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                        .padding()

                    VStack(spacing: 20) {
                        Image(systemName: "cloud.rain.fill")
                            .font(.system(size: 40))

                        Text(weather.weather[0].main)
                    }
                }
            }
            .frame(maxWidth: .infinity)

            Spacer()

        }
        .frame(maxHeight: .infinity)
        .padding()
        .sheet(isPresented: $showSheet) {

            WeatherDetailsView(weather: weather)
                

        }
        

    }
}

#Preview {
    WeatherDataView(weather: WeatherData(
        weather: [
            WeatherData.WeatherResponse(main: "Clear", icon: "01d")
        ],
        main: WeatherData.MainResponse(
            temp: 21.5,
            feels_like: 19.5,
            temp_min: 18.0,
            temp_max: 23.0,
            pressure: 1012,
            humidity: 60
        ), visibility: 10_000,
        name: "Moscow",
        wind: WeatherData.WindResponse(speed: 5.5), clouds: WeatherData.CloudsResponse(all: 83))
    )
    .background(.accent)
    .preferredColorScheme(.dark)
}
