//
//  MapMatchingResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation
import SwiftlyRest

internal typealias MapMatchingCall = Result<MapMatchingResponse, SwiftlyRestError>

/// Represents the response for a map matching request.
///
/// - Parameters:
///   - trip: The main matched trip response.
///   - alternates: Optional alternate trip responses.
public struct MapMatchingResponse: Codable, Sendable {
    
    let trip: TripResponse
    let alternates: [TripResponse]?
    
}
