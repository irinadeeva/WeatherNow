//
//  NoPermissionView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 26/10/24.
//

import SwiftUI

struct NoPermissionView: View {
    var body: some View {
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

#Preview {
    NoPermissionView()
}
