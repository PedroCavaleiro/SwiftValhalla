//
//  TravelMode.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the different travel modes for edges in Valhalla routing.
///
/// Each case corresponds to a specific mode of transportation.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum TravelMode: String, Codable, CaseIterable {
    case drive = "drive"
    case pedestrian = "pedestrian"
    case bicycle = "bicycle"
    case transit = "transit"
}
