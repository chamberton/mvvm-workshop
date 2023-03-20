//
//  AnimeDetailViewModel.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//


import Foundation
import Combine

class AnimeDetailViewModel {
    @Published private(set) var anime: AnimeModel
    
    
    init(anime : AnimeModel) {
        self.anime = anime
    }
   
    
}
