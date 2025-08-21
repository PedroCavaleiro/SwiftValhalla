//
//  TraceOptions.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Additional options to the trace
/// - Parameters:
///   - searchRadius: Search radius in meters associated with supplied trace points.
///   - gpsAccuracy: GPS accuracy in meters associated with supplied trace points.
///   - breakageDistance: Breaking distance in meters between trace points.
///   - interpolationDistance: Interpolation distance in meters beyond which trace points are merged together.
public struct TraceOptions: Codable {
    
    let searchRadius: Int?
    let gpsAccuracy: Int?
    let breakageDistance: Int?
    let interpolationDistance: Int?
    
    /// Initializer
    /// - Parameters:
    ///   - searchRadius: Search radius in meters associated with supplied trace points.
    ///   - gpsAccuracy: GPS accuracy in meters associated with supplied trace points.
    ///   - breakageDistance: Breaking distance in meters between trace points.
    ///   - interpolationDistance: Interpolation distance in meters beyond which trace points are merged together.
    public init(searchRadius: Int? = nil, gpsAccuracy: Int? = nil, breakageDistance: Int? = nil, interpolationDistance: Int? = nil) {
        self.searchRadius = searchRadius
        self.gpsAccuracy = gpsAccuracy
        self.breakageDistance = breakageDistance
        self.interpolationDistance = interpolationDistance
    }
    
    enum CodingKeys: String, CodingKey {
        case searchRadius = "search_radius"
        case gpsAccuracy = "gps_accuracy"
        case breakageDistance = "breakage_distance"
        case interpolationDistance = "interpolation_distance"
    }
    
}
