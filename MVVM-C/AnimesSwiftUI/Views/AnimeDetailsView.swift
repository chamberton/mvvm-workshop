//
//  FamousAnimeVoicesView.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import SwiftUI

struct AnimeDetailsView: SwiftUI.View {
    @StateObject var viewModel: AnimeDetailsSwiftUIViewModel
    
    var body: some SwiftUI.View {
        ScrollView(.vertical) {
            VStack(alignment: .center){
                if let image = UIImage(named: viewModel.anime.image) {
                    Image(uiImage: image).resizable().scaledToFit()
                }
                Text("Overview").font(.headline).bold()
                Text(viewModel.anime.description).padding(20)
            }
        }.navigationTitle(viewModel.anime.name)
    }
    
}
