//
//  AnimeListViewModelTests.swift
//  MVVM-CTests
//
//  Created by Serge Mbamba on 2023/03/27.
//

import XCTest
@testable import MVVM_C

final class AnimeListViewModelTests: XCTestCase {
    var systemUnderTest: AnimeListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // Identify a mocking framework to inject fakes for AnimeListService and AnimesCoordinator
        // systemUnderTest = AnimeListViewModel(service: AnimeListService, coordinator: AnimesCoordinator)
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
