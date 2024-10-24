//
//  OnboardingView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            Text("Hello")
            Button {
                isFirstLaunch = false
                dismiss()
            } label: {
                Text("Got it")
            }
        }
    }
}

#Preview {
    OnboardingView()
}
