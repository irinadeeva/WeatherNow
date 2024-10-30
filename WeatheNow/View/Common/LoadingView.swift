//
//  LoadingView.swift
//  WeatheNow
//
//  Created by Irina Deeva on 30/10/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
    }
}

#Preview {
    LoadingView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
