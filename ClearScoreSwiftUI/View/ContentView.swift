//
//  ContentView.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/06/06.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @StateObject private var viewModel: ClearScoreViewModel

    init() {
           let service = DataService()
           _viewModel = StateObject(wrappedValue: ClearScoreViewModel(service: service))
       }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                if isActive {
                    RegistrationView(viewModel: viewModel)
                } else {
                    SplashView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
        .tint(.black)
    }
}

