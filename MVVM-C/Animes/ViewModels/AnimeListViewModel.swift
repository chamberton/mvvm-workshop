//
//  AnimeListViewModel.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import Combine
import os.log

final class AnimeListViewModel {
    enum State {
        case loading
        case failed(String)
        case loaded([AnimeModel])
    }
    private lazy var logger = Logger(subsystem: "AnimeListViewModel", category: "ViewModel")
    private let service: AnimeListService
    private weak var coordinator: AnimesCoordinator?
    // Simply marking a property with the @Published property wrapper
    // is enough to make the system emit observable events whenever
    // a new value was assigned to it.
    @Published private(set) var state = State.loading
    
    var animes: [AnimeModel]? {
        guard case .loaded (let animes) = state else { return nil }
        return animes
    }
    
    init(service : AnimeListService, coordinator: AnimesCoordinator) {
        self.service = service
        self.coordinator = coordinator
        Task {
            self.fetchAnimes()
        }
    }
    
    private func loadDetailsOfAnime(at index: Int) -> AnimeModel? {
        self.animes?[index]
    }
    
    func showDetailsOfAnime(at index: Int) {
        guard let anime = loadDetailsOfAnime(at: index) else {
            logger.info("Anime not found at index \(index)")
            return
        }
        coordinator?.showDetails(of: anime)
    }
    
    func nameOfAnime(at index: Int) -> String? {
        animes?[index].name
    }
    
    func fetchAnimes() {
        service.fetchAnimes { [weak self] animes in
            if let animes {
                self?.state = .loaded(animes)
            } else {
                self?.state = .failed("Could not load anime details")
            }
        }
    }
}
