//
//  RouteResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

public typealias TripResponse = RouteResponse

/// Represents a route/trip response returned by a routing service,
/// including status, language/units, and optional summary/legs/locations.
///
/// - Parameters:
///   - status: Numeric status code for the response.
///   - statusMessage: Human-readable status message.
///   - units: Units used in the response (e.g., metric/imperial).
///   - language: Language code used for textual responses.
///   - summary: Optional overall route summary.
///   - legs: Optional array of legs for the route.
///   - locations: Optional array of locations associated with the route.
public struct RouteResponse: Codable, Sendable {
    
    public let status: Int
    public let statusMessage: String
    public let units: String
    public let language: String
    
    // Optional Fields depending on the service
    public let summary: SummaryResponse?
    public let legs: [LegResponse]?
    public let locations: [Location]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusMessage = "status_message"
        case units = "units"
        case language = "language"
        case summary = "summary"
        case legs = "legs"
        case locations = "locations"
    }
    
}
