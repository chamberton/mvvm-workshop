//
//  DataSourceAbstractions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation

// MARK: - AnimeDataSource

protocol AnimeDataSource {
    func getAllAnimes() -> [AnimeModel]?
    func getAnime(by id : Int) -> AnimeModel?
}
