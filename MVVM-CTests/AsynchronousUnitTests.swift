//
//  AsynchronousUnitTests.swift
//  MVVM-CTests
//
//  Created by Serge Mbamba on 2023/03/27.
//

import XCTest

class MyDocument: UIDocument {

    var documentText: String?
    
    override func contents(forType typeName: String) throws -> Any {
        if let content = documentText {
            let length =
              content.lengthOfBytes(using: String.Encoding.utf8)
            return NSData(bytes:content, length: length)
        } else {
            return Data()
        }
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?)
     throws {
        if let userContent = contents as? Data {
            documentText = NSString(bytes: (contents as AnyObject).bytes,
                       length: userContent.count,
                       encoding: String.Encoding.utf8.rawValue) as String?
        }
    }
    
}

final class AsynchronousUnitTests: XCTestCase {

    // Test that the document is opened. Because opening is asynchronous,
    // use XCTestCase's asynchronous APIs to wait until the document has
    // finished opening.
    
    func testDocumentOpening() throws {
        // Create an expectation object.
        // This test only has one, but it's possible to wait on multiple expectations.
        let documentOpenExpectation = XCTestExpectation(description: "Document open")
    
    
        guard let url = Bundle(for: Self.self).url(forResource: "document", withExtension: "txt") else {
            XCTFail("Missing resource test file named document.txt")
            return
        }
        
        let doc = MyDocument(fileURL: url)
        
        doc.open() { success in
          
            XCTAssert(success)
            // Possibly assert other things here about the document after it has opened...
            XCTAssertNotNil(doc.documentText)
            
            // Fulfill the expectation-this will cause -waitForExpectation
            // to invoke its completion handler and then return.
            documentOpenExpectation.fulfill()
        }
     
    
        wait(for: [documentOpenExpectation], timeout: TimeInterval(2))
    }
}
