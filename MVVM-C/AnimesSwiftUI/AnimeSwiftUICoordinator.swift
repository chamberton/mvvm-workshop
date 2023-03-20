//
//  ExtrasCoordinator.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import SwiftUI

final class ExtrasCoordinatorImplementation: AnimeSwiftUICoordinator {
    private var rootViewController: UINavigationController!
    private let dataStore: AnimeDataSource
    
    func view(for anime: AnimeModel) -> AnimeDetailsView {
        AnimeDetailsView(viewModel: AnimeDetailsSwiftUIViewModel(coordinator: self, anime: anime))
    }
    
    init(dataStore : AnimeDataSource = AnimeDataSourceImplementation()) {
        self.dataStore = dataStore
    }
    
    func start() -> UIViewController {
        let service = AnimeListServiceImplementation(dataStore: dataStore)
        let viewModel = AnimesSwiftUIViewModel(coordinator: self, service: service)
        let extrasHostingViewController = UIHostingController(rootView: AnimesView(viewModel: viewModel))
        rootViewController = UINavigationController(rootViewController: extrasHostingViewController)
        extrasHostingViewController.tabBarItem.title = "Animes SwiftUI"
        return extrasHostingViewController
    }
    
}
