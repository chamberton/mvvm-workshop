//
//  View+Extensions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import SwiftUI

extension SwiftUI.View {
    
    func makeErrorView(reason: String, title: String?,  retryHandler: RetryDetails) -> Alert {
        Alert(
            title: Text(title ?? "Error"),
            message: Text(reason),
            dismissButton: .default(Text(retryHandler.title), action: {
                retryHandler.action()
            })
        )
    }
    
   
}
