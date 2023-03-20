//
//  ExtrasView.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import SwiftUI

struct AnimesView: SwiftUI.View {
    @StateObject var viewModel: AnimesSwiftUIViewModel
    
    
    var body: some SwiftUI.View {
        NavigationView {
            if let animes = viewModel.animes {
                List(animes, id: \.name) { animeItem in
                    NavigationLink(destination: viewModel.loadView(for: animeItem)) {
                        Text(animeItem.name)
                    }
                }.navigationTitle("Animes")
            } else if let message = viewModel.errorMessage {
                EmptyView().alert(isPresented: viewModel.$inErrorState) {
                    makeErrorView(reason: message,title: nil, retryHandler: ("Retry", {[self] in
                        viewModel.loadAnimes()
                    }))
                    
                }.navigationTitle("Animes")
            } else {
                ProgressView().navigationTitle("Animes")
            }
                
        }.onAppear() {
            viewModel.loadAnimes()
        }
        
    }
}
