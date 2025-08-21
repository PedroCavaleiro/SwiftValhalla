//
//  File.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Transit route information for a transit leg, including identifiers,
/// names, colors, operator info, and stops.
///
/// - Parameters:
///   - onestopId: OneStop identifier for the transit route.
///   - shortName: Short name of the route.
///   - longName: Long name of the route.
///   - headsign: Headsign displayed for the transit service.
///   - color: Route color as an integer.
///   - textColor: Text color as an integer.
///   - description: Route description.
///   - operatorOnestopId: Operator OneStop identifier.
///   - operatorName: Operator human-readable name.
///   - operatorUrl: Operator website URL.
///   - transitStops: Array of stops for this transit route.
public struct TransitInfo: Codable {
    
    public let onestopId: String
    public let shortName: String
    public let longName: String
    public let headsign: String
    public let color: Int
    public let textColor: Int
    public let description: String
    public let operatorOnestopId: String
    public let operatorName: String
    public let operatorUrl: String
    public let transitStops: [TransitStop]
    
    enum CodingKeys: String, CodingKey {
        case onestopId = "onestop_id"
        case shortName = "short_name"
        case longName = "long_name"
        case headsign = "headsign"
        case color = "color"
        case textColor = "text_color"
        case description = "description"
        case operatorOnestopId = "operator_onestop_id"
        case operatorName = "operator_name"
        case operatorUrl = "operator_url"
        case transitStops = "transit_stops"
    }
    
}
