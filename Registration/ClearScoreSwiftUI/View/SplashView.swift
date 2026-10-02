//
//  SplashView.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/06/06.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white
                   .ignoresSafeArea()
                Image("score.png")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashView()
}
