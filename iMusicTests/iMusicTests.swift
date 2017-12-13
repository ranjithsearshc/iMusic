//
//  iMusicTests.swift
//  iMusicTests
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import XCTest
@testable import iMusic

class iMusicTests: XCTestCase {
    
    
    private var albumFeed = [Album]()
    
    override func setUp() {
        super.setUp()
        let jsonData = readJSON(fromFile: "data")
        if let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
            let result = AlbumFeedResult(fromDictionary: jsonObj!)
            self.albumFeed = result.feed.results
        }
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testnumberOfRowsToDisplay() {
        XCTAssertTrue(albumFeed.count == 10)
    }
    
    func testAlbumData() {
       
        XCTAssertTrue(albumFeed[1].artistId == "1273783982")
        XCTAssertTrue(albumFeed[1].artistName == "Quality Control")
        XCTAssertTrue(albumFeed[1].artistUrl == "https://itunes.apple.com/us/artist/quality-control/1273783982?app=music")
        XCTAssertTrue(albumFeed[1].artworkUrl100 == "http://is3.mzstatic.com/image/thumb/Music118/v4/9f/75/f1/9f75f158-33a3-fa9b-c4f1-ceaffdf1be8f/UMG_cvrart_00602567011712_01_RGB72_3000x3000_17UM1IM61531.jpg/200x200bb.png")
        XCTAssertTrue(albumFeed[1].name == "Quality Control: Control the Streets, Vol. 1")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension XCTestCase {
    
    func readJSON(fromFile file: String) -> Data {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") else {
            fatalError("\(file).json not found")
        }
        
        guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert \(file).json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert \(file).json to NSData")
        }
        
        return jsonData
    }
}
