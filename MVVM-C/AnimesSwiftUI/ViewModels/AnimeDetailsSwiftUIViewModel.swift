//
//  AnimeDetailsSwiftUIViewModel.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import Combine
import SwiftUI

class AnimeDetailsSwiftUIViewModel: ObservableObject {
    private lazy var store = [AnyCancellable]()
    private let coordinator: AnimeSwiftUICoordinator
    
    @Published private(set) var anime: AnimeModel
    
    
    init(coordinator: AnimeSwiftUICoordinator, anime: AnimeModel) {
        self.coordinator = coordinator
        self.anime = anime
    }
}

