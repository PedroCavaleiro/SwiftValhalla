//
//  PriorityType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

/// Priority type for matrix calculations
public enum PriorityType: String, Codable, Sendable {
    /// Prioritize by travel time
    case time = "time"
    /// Prioritize by distance
    case distance = "distance"
}
