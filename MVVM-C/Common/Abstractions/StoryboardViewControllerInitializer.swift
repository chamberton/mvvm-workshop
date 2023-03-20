//
//  StoryboardViewControllerInitializer.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.


import Foundation
import UIKit

/**
 For initializeing story board and instantiaing ViewController .
 
 - storyboardIdentifier : Should be same as class name
 - storyboardName : storyboard enum
 - instantiateViewController : for instantiating viewcontroller
 */

protocol StoryboardViewController: UIViewController {
    static var storyboardIdentifier: String { get }
    @MainActor func configureTitleAsLarge()
}

typealias RetryDetails = (title: String,  action: (() -> Void))

protocol View {
    func renderFailure(reason: String, title: String?,  retryHandler: RetryDetails)
}


protocol StoryboardViewControllerInitializer {
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController<T: StoryboardViewController>(_ type: T.Type) -> T
}
