//
//  wireframe.swift
//  ClearScore
//
//  Created by Rider on 2026/05/03.
//

import SwiftUI
import UIKit

class Wireframe: WireframeDelegate {
    
    static let shared = Wireframe()
    
    func transitionToHomeView(controller: UIViewController, viewModel: ClearScoreViewModel?) {
//        let newView = HomeView(viewModel: viewModel)
//        let hostingController = UIHostingController(rootView: newView)
//        controller.navigationController?.pushViewController(hostingController, animated: true)
    }
    
    func transitionToDetailView(controller: UIViewController, viewModel: ClearScoreViewModel?) {
//        let newView = DetailView(viewModel: viewModel)
//        let hostingController = UIHostingController(rootView: newView)
//        controller.navigationController?.pushViewController(hostingController, animated: true)
    }
}
