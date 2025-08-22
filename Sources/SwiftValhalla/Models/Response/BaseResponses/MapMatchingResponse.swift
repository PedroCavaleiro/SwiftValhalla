//
//  MapMatchingResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation
import SwiftlyRest

public typealias MapMatchingCall = Result<MapMatchingResponse, SwiftlyRestError>

/// Represents an alternate route option in the map matching response.
public struct AlternateResponse: Codable, Sendable {
    public let trip: TripResponse
}

/// Represents the response for a map matching request.
///
/// - Parameters:
///   - trip: The main matched trip response.
///   - alternates: Optional alternate trip responses.
public struct MapMatchingResponse: Codable, Sendable {
    
    public let trip: TripResponse
    public let alternates: [AlternateResponse]?
    
}
