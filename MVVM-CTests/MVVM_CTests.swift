//
//  MVVM_CTests.swift
//  MVVM-CTests
//
//  Created by Serge Mbamba on 2023/03/27.
//  Copyright © 2023 Osama Bin Bashir. All rights reserved.
//

import XCTest

@testable import MVVM_C
struct SomeTestDependency {
    
}

class ExampleTests: XCTestCase {
    private var someSutDependency: SomeTestDependency!

    override func setUpWithError() throws {
        try super.setUpWithError()
        someSutDependency = SomeTestDependency()
    }

    func testFirstNameNotEmpty() throws {
        let presencesByNames = ["Antoine": true, "Bob": false]
        /// Will throw if presencesByNames["Antoine"] is null
        let isAntoinePresent =  try XCTUnwrap(presencesByNames["Antoine"])
        XCTAssertTrue(isAntoinePresent)
    }
    
    func testDecoding() throws {
        guard let url = Bundle(for: Self.self).url(forResource: "user", withExtension: "json") else {
            XCTFail("Missing resource test file named user.json")
            return
        }

        /// When the Data initializer is throwing an error, the test will fail.
        let jsonData = try Data(contentsOf: url)
        /// The `XCTAssertNoThrow` can be used to get extra context about the throw
        XCTAssertNoThrow(try JSONDecoder().decode(AnimeModel.self, from: jsonData))
    }

    override func tearDown() {
        someSutDependency = nil
        super.tearDown()
    }

}

