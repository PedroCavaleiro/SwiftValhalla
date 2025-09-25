//
//  MatrixElement.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation

/// Represents a single element in the matrix result.
///
/// Each matrix element contains the computed time and distance between
/// a source and target location. If no route can be found, the element
/// will be null in the response.
///
/// - Parameters:
///   - time: Travel time in seconds
///   - distance: Travel distance in the units specified in the request
///   - toEdgeDistance: Distance from the target input coordinate to the graph edge in meters
///   - fromEdgeDistance: Distance from the source input coordinate to the graph edge in meters
public struct MatrixElement: Codable, Sendable {
    
    /// Travel time in seconds
    public let time: Double
    
    /// Travel distance in the units specified in the request (kilometers or miles)
    public let distance: Double
    
    /// Distance from the target input coordinate to the graph edge in meters
    public let toEdgeDistance: Double?
    
    /// Distance from the source input coordinate to the graph edge in meters
    public let fromEdgeDistance: Double?
    
    public init(
        time: Double,
        distance: Double,
        toEdgeDistance: Double? = nil,
        fromEdgeDistance: Double? = nil
    ) {
        self.time = time
        self.distance = distance
        self.toEdgeDistance = toEdgeDistance
        self.fromEdgeDistance = fromEdgeDistance
    }
    
    enum CodingKeys: String, CodingKey {
        case time
        case distance
        case toEdgeDistance = "to_edge_distance"
        case fromEdgeDistance = "from_edge_distance"
    }
}
