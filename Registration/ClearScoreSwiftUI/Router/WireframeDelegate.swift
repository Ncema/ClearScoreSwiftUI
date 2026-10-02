//
//  WireframeDelegate.swift
//  ClearScore
//
//  Created by Rider on 2026/05/03.
//

import UIKit

protocol WireframeDelegate {
    func transitionToHomeView(controller: UIViewController,viewModel: ClearScoreViewModel?)
    func transitionToDetailView(controller: UIViewController, viewModel: ClearScoreViewModel?)
}
