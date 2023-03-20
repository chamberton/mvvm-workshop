//
//  AnimeesAbstractions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation
import Combine

enum AnimeServiceError: Error {
    case failed
    
    var message: String {
        return "An error occurred"
    }
}

class AnimeListServiceImplementation : AnimeListService {
    private let dataStore: AnimeDataSource
    
    init(dataStore : AnimeDataSource) {
        self.dataStore = dataStore
    }
    
    func fetchAnimes(response: @escaping ([AnimeModel]?) -> ()) {
        let data = dataStore.getAllAnimes()
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) { // This 2 seconds delay is introduced to simulate network call duration
            response(data)
        }
    }
    
    func loadDetailsForAnime(identifiedBy id : Int) async throws -> AnimeModel {
        let data = dataStore.getAnime(by: id)
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) { // This 2 seconds delay is introduced to simulate network
                if let data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: AnimeServiceError.failed)
                }
            }
        }
    }

    
    // SwiftUI friendly API
    func fetchAnimes() -> AnyPublisher<[AnimeModel], AnimeServiceError> {
        let data = dataStore.getAllAnimes()
        if let data {
            return CurrentValueSubject(data).eraseToAnyPublisher()
        } else {
            return Fail(error: AnimeServiceError.failed).eraseToAnyPublisher()
        }
    }
    
    
}
