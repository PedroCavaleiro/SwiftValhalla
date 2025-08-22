//
//  File.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//
//  TODO: Implement level_changes
//  If a trip leg includes level changes (i.e. when navigating inside a building), the summary will include an array in the form of `[[shape_index, level], ...]` that can be used to split up the geometry along the level changes.
//

import Foundation

/// Summary information for a route or leg, including time, length,
/// bounding box coordinates, and cost flags.
///
/// - Parameters:
///   - time: Total time in seconds.
///   - length: Total length in meters.
///   - hasToll: Whether the route includes tolls.
///   - hasFerry: Whether the route includes ferries.
///   - hasHighway: Whether the route includes highways.
///   - minimumLatitude: Minimum latitude of the route bounding box.
///   - minimumLongitude: Minimum longitude of the route bounding box.
///   - maximumLatitude: Maximum latitude of the route bounding box.
///   - maximumLongitude: Maximum longitude of the route bounding box.
///   - cost: Cost metric for the route.
public struct SummaryResponse: Codable, Sendable {
    
    public let time: Double
    public let length: Double
    public let hasToll: Bool
    public let hasFerry: Bool
    public let hasHighway: Bool
    public let hasTimeRestrictions: Bool
    public let minimumLatitude: Double
    public let minimumLongitude: Double
    public let maximumLatitude: Double
    public let maximumLongitude: Double
    public let cost: Double
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case length = "length"
        case hasToll = "has_toll"
        case hasFerry = "has_ferry"
        case hasHighway = "has_highway"
        case hasTimeRestrictions = "has_time_restrictions"
        case minimumLatitude = "min_lat"
        case minimumLongitude = "min_lon"
        case maximumLatitude = "max_lat"
        case maximumLongitude = "max_lon"
        case cost = "cost"
    }
    
}
