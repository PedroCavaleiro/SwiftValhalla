//
//  VehicleType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the different vehicle types for edges in Valhalla routing.
///
/// Each case corresponds to a specific type of motorized vehicle.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum VehicleType: String, Codable, CaseIterable, Sendable {
    case car = "car"
    case motorcycle = "motorcycle"
    case bus = "bus"
    case tractorTrailer = "tractor_trailer"
}
