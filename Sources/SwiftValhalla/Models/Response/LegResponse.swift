//
//  LegResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents a single leg within a route, containing its maneuvers,
/// an optional summary, and an optional encoded shape.
///
/// - Parameters:
///   - maneuvers: An array of maneuvers for the leg, if present.
///   - summary: Summary information for the leg, if present.
///   - shape: Encoded polyline/string representing the leg's geometry, if present.
public struct LegResponse: Codable, Sendable {
    
    public let maneuvers: [ManeuverResponse]?
    public let summary: SummaryResponse?
    public let shape: String?
    
}
