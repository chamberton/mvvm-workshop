//
//  UIViewControllers+Extensions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.

import UIKit


extension View where Self: UIViewController {
    
    func renderFailure(reason: String, title: String?,  retryHandler: RetryDetails) {
        let alert = UIAlertController(title: title ?? "Error", message: reason, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:  retryHandler.title, style: UIAlertAction.Style.default) { _ in
            retryHandler.action()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func renderFailure(reason: String,  retryHandler: RetryDetails) {
        renderFailure(reason: reason, title: nil,  retryHandler: retryHandler)
    }
}

extension UIViewController {
    @MainActor func configureTitleAsLarge() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
}
