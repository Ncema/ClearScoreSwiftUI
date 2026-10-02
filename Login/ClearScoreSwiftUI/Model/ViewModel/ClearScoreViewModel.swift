//
//  ClearScoreViewModel.swift
//  ClearScore
//
//  Created by Rider on 2026/05/31.
//

import Foundation
import SwiftUI

final class ClearScoreViewModel: ObservableObject {
    
    private let service: DataServiceProtocol?
    
    @Published var scoreModel: ScoreResponseModel?
    
    @Published var isLoading: Bool = false
    
    var onScoreLoaded: (() -> Void)?
    var onError: ((String) -> Void)?
    
    init(service: DataServiceProtocol) {
        self.service = service
    }
    
    func fetchScore() {
        isLoading = true

        service?.fetchData(path: Path.getScore.rawValue) {
            [weak self] (result: Result<ScoreResponseModel, Error>) in

            DispatchQueue.main.async {
                guard let self = self else { return }

                self.isLoading = false

                switch result {

                case .success(let response):
                    self.scoreModel = response
                    self.onScoreLoaded?()

                case .failure:
                    self.onError?("Technical Error")
                }
            }
        }
    }
}
