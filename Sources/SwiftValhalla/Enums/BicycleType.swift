//
//  BicycleType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents different bicycle types for edges in Valhalla routing.
///
/// Each case corresponds to a specific type of bicycle or cycling preference.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum BicycleType: String, Codable, CaseIterable, Sendable {
    case road = "road"
    case cross = "cross"
    case hybrid = "hybrid"
    case mountain = "mountain"
}
