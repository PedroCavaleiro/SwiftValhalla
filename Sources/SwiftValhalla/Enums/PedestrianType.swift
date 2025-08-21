//
//  PedestrianType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents different pedestrian types for edges in Valhalla routing.
///
/// Each case corresponds to a specific type of pedestrian or mobility mode.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum PedestrianType: String, Codable, CaseIterable {
    case foot = "foot"
    case wheelchair = "wheelchair"
    case segway = "segway"
}
