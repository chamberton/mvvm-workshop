//
//  AppCoordinator.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.

import Foundation
import UIKit

final class AppCoordinator : Coordinator {
    private let window : UIWindow
    private lazy var animesCoordinator = AnimesCoordinatorImplementation()
    private lazy var extrasCoordinator = ExtrasCoordinatorImplementation()
    private lazy var tabBarController = UITabBarController()

    init(window: UIWindow) {
        self.window = window
    }
    
    @discardableResult
    func start() -> UIViewController {
        setupTabController()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        return tabBarController
    }
    
    private func setupTabController() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().backgroundColor = .groupTableViewBackground
        tabBarController.tabBar.standardAppearance = appearance
        let tabViewControllers = makeTabViewControllers()
        tabBarController.setViewControllers(tabViewControllers, animated: false)
    }
    
    private func makeTabViewControllers() -> [UIViewController] {
        let firstTabRootViewController = animesCoordinator.start()
        let secondTabRootViewController = extrasCoordinator.start()
        return  [firstTabRootViewController, secondTabRootViewController]
    }
}
