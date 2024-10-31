//
//  WeatherDetailsView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 30/10/24.
//

import SwiftUI

struct WeatherDetailsView: View {
    let weather: WeatherData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Weather Now")
                    .bold()
                    .padding(.vertical)

                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))

                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + " m/s"))

                        WeatherRow(logo: "thermometer", name: "Feels like", value: (weather.main.feelsLike.roundDouble() + "°"))

                        WeatherRow(logo: "speedometer", name: "Pressure", value: (weather.main.pressure.notRoundDouble() + "hPa"))
                    }
                    .frame(maxHeight: .infinity)

                    Spacer()

                    VStack(alignment: .leading) {
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))

                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.toString() + "%"))

                        WeatherRow(logo: "eye.fill", name: "Visibility", value: (weather.visibility.roundToKilometer() + " km"))

                        WeatherRow(logo: "cloud.fill", name: "Cloudiness", value: (weather.clouds.all.toString() + "%"))
                    }
                    .frame(maxHeight: .infinity)
                }
//                .frame(maxHeight: .infinity)
            }
        }
        .scrollDisabled(true)
        .scrollIndicators(.hidden)
        .interactiveDismissDisabled()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .padding(.horizontal)
        .foregroundColor(.accent)
        .background(.white)
        .presentationDetents([.fraction(0.25), .medium])
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    WeatherDetailsView(weather: WeatherData(

        weather: [
            WeatherData.WeatherResponse(main: "Clear", icon: "01d")
        ],
        main: WeatherData.MainResponse(
            temp: 20.5,
            feels_like: 19.5,
            temp_min: 18.0,
            temp_max: 23.0,
            pressure: 1012,
            humidity: 60
        ), visibility: 10_000,
        name: "Moscow",
        wind: WeatherData.WindResponse(speed: 5.5), clouds:  WeatherData.CloudsResponse(all: 83))
    )
}

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(.grey)
                .cornerRadius(50)

            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title2)
            }
        }
    }
}
