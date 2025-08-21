//
//  TransitType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents different transit types for edges in Valhalla routing.
///
/// Each case corresponds to a specific public transit or cable transport type.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum TransitType: String, Codable, CaseIterable {
    case tram = "tram"
    case metro = "metro"
    case rail = "rail"
    case bus = "bus"
    case ferry = "ferry"
    case cableCar = "cable_car"
    case gondola = "gondola"
    case funicular = "funicular"
}

