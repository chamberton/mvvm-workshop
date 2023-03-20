//
//  AppCoordinatorAbstractions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.


import Foundation
import UIKit
import SwiftUI

public protocol Coordinator: AnyObject {
    @discardableResult
    func start() -> UIViewController
}

public protocol SwiftUICoordinator: AnyObject {
    @discardableResult
    func start() -> AnyView
}
