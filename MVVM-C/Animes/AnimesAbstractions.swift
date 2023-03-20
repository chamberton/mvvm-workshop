//
//  AnimeesAbstractions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import UIKit
import Combine

// MARK: - AnimeListService

protocol AnimeListService {
    func fetchAnimes(response : @escaping([AnimeModel]?)->())
    func loadDetailsForAnime(identifiedBy id : Int) async throws -> AnimeModel
    func fetchAnimes() -> AnyPublisher<[AnimeModel], AnimeServiceError>
}


// MARK: - AnimeListCoordinator

protocol AnimesCoordinator: Coordinator {
    func showDetails(of anime: AnimeModel)
}
