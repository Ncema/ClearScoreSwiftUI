//
//  ClearScoreSwiftUIApp.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/06/06.
//

import SwiftUI

@main
struct ClearScoreSwiftUIApp: App {
    @StateObject public var viewModel: ClearScoreViewModel
    
    init() {
           let service = DataService()
           _viewModel = StateObject(wrappedValue: ClearScoreViewModel(service: service))
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
