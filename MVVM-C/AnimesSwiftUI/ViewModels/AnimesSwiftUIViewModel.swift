//
//  ExtrasViewModel.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import Combine
import SwiftUI
import os.log

class AnimesSwiftUIViewModel: ObservableObject {
    private lazy var logger = Logger(subsystem: "AnimeListCoordinator", category: "Navigation")
    
    private lazy var store = [AnyCancellable]()
    private let coordinator: AnimeSwiftUICoordinator
    private let service: AnimeListService
    
    // MARK: - State variables
    @Published private(set) var animes : [AnimeModel]?
    @State private(set) var inErrorState : Bool = false
    
    private(set) var errorMessage : String? {
        didSet {
            inErrorState = errorMessage != nil
        }
    }
    
    init(coordinator: AnimeSwiftUICoordinator, service: AnimeListService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    func loadView(for item: AnimeModel) -> AnimeDetailsView? {
        coordinator.view(for: item)
    }
    
    func loadAnimes() {
        errorMessage = nil
        animes = nil
        store.append(
            service.fetchAnimes().receive(on: DispatchQueue.main).sink { [weak self] status in
                switch status {
                case .failure(let error):
                    self?.logger.error("\(error.localizedDescription)")
                    self?.animes = nil
                    self?.errorMessage = error.message
                case .finished:
                    break
                }
            } receiveValue: { [weak self] animes in
                self?.animes = animes
            }
        )
    }
    
    
    deinit {
        store.removeAll()
    }
}
