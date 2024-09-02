//
//  TokenizerTests.swift
//  MLXSwiftGPT2Tests
//
//  Created by Ronald Mannak on 9/2/24.
//

import XCTest
@testable import MLXSwiftGPT2

final class TokenizerTests: XCTestCase {

    var tokenizer: Tokenizer!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.        
        
        tokenizer = try Tokenizer()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncode() throws {
        
        // Testing the functions
        let encoded = tokenizer.encode("Hello, world!")
        XCTAssertEqual(encoded, [20, 43, 50, 50, 53, 6, 1, 61, 53, 56, 50, 42, 2])
    }
    
    func testDecode() throws {
        let decoded = tokenizer.decode([20, 43, 50, 50, 53, 6, 1, 61, 53, 56, 50, 42, 2])
        XCTAssertEqual(decoded, "Hello, world!")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
