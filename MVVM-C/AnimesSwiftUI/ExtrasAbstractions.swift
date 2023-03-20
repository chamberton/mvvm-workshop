//
//  ExtrasAbstractions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.

import Foundation
import SwiftUI

// MARK: - AnimeListService

protocol ExtrasService {
    func fetchFamousAnimeVoice(response : @escaping([AnimeModel]?)->())
}


// MARK: - AnimeListCoordinator

protocol AnimeSwiftUICoordinator: Coordinator {
    func view(for anime: AnimeModel) -> AnimeDetailsView
}
