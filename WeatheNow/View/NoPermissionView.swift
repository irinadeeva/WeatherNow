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
            Text("Please check permissions")
                .bold()
                .font(.title)

            Text("The Weather Now App has no access to the location service")
                .padding()
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoPermissionView()
}
