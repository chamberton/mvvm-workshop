//
//  AnimeesAbstractions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import UIKit
import os.log

class AnimesCoordinatorImplementation: AnimesCoordinator {
    private lazy var logger = Logger(subsystem: "AnimeListCoordinator", category: "Navigation")
    private var rootViewController: UINavigationController!
    private let dataStore : AnimeDataSource
    
    init(dataStore : AnimeDataSource = AnimeDataSourceImplementation()) {
        self.dataStore = dataStore
    }
    
    func start() -> UIViewController {
        let listViewController = Self.instantiateViewController(AnimeListViewController.self)
        rootViewController = UINavigationController(rootViewController: listViewController)
        let service = AnimeListServiceImplementation(dataStore: dataStore)
        let viewModel = AnimeListViewModel(service: service, coordinator: self)
        listViewController.viewModel = viewModel
        
        return rootViewController
    }
    
    func showDetails(of anime: AnimeModel) {
        let detailViewController = Self.instantiateViewController(AnimeDetailViewController.self)
        let viewModel = AnimeDetailViewModel(anime: anime)
        detailViewController.viewModel = viewModel
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - StoryboardInitializable

extension AnimesCoordinatorImplementation : StoryboardViewControllerInitializer {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}



