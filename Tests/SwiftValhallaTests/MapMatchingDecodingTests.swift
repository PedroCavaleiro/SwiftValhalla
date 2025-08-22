import XCTest
@testable import SwiftValhalla

final class MapMatchingDecodingTests: XCTestCase {
    
    func testMapMatchingResponseDecoding() throws {
        // Read the JSON test file from Sources directory
        let currentDir = FileManager.default.currentDirectoryPath
        let jsonPath = "\(currentDir)/Sources/jsonTest.json"
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
        
        // Try to decode it
        let decoder = JSONDecoder()
        let response = try decoder.decode(MapMatchingResponse.self, from: jsonData)
        
        // Basic assertions
        XCTAssertEqual(response.trip.status, 0)
        XCTAssertEqual(response.trip.statusMessage, "Found route between points")
        XCTAssertEqual(response.trip.units, "kilometers")
        XCTAssertEqual(response.trip.language, "en-US")
        
        // Check that we have locations and legs
        XCTAssertNotNil(response.trip.locations)
        XCTAssertNotNil(response.trip.legs)
        XCTAssertNotNil(response.trip.summary)
        
        // Check location details
        let firstLocation = try XCTUnwrap(response.trip.locations?.first)
        XCTAssertEqual(firstLocation.latitude, 40.088741)
        XCTAssertEqual(firstLocation.longitude, -8.875526)
        XCTAssertEqual(firstLocation.traceType, .break)
        XCTAssertEqual(firstLocation.originalIndex, 0)
    }
}
