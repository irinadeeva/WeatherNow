//
//  ContentView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
//        // TODO: handle yes/no for request Location
//        if locationManager.isNonAuthorised {
            WeatherView()
//        } else {
//            Text("Please, give a permission of your Location")
//                .fullScreenCover(isPresented: $locationManager.isNonAuthorised, content: {
//                    Text("Please, give a permission of your Location")
//                        .toolbar(.hidden, for: .automatic)
//                })

//        }
    }
}

//#Preview {
//    ContentView()
//        .environment(LocationManager())
//}
