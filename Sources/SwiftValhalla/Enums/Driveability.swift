//
//  Driveability.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Aliases for `Driveability` to represent the allowed travel directions for different modes of movement.
///
/// - `Traversability`: Directional access for vehicles along an edge.
/// - `Cyclability`: Directional access for bicycles along an edge.
/// - `Walkability`: Directional access for pedestrians along an edge.
///
/// These typealiases reuse `Driveability` to indicate whether travel is allowed
/// `forward`, `backward`, or in `both` directions for the respective mode.
public typealias Traversability = Driveability
public typealias Cyclability = Driveability
public typealias Walkability = Driveability

/// Represents the allowed driving directions for an edge in Valhalla routing.
/// Each case corresponds to the permitted direction(s) of travel along an edge
///
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for easy serialization, and `CaseIterable` for iteration.
public enum Driveability: String, Codable, CaseIterable {
    /// Travel is allowed only in the forward direction.
    case forward = "forward"
    /// Travel is allowed only in the backward direction.
    case backward = "backward"
    /// Travel is allowed in both directions.
    case both = "both"
}
