//
//  File.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// An enum that pairs a travel mode with a specific subtype value.
///
/// Used to represent the concrete travel variant for a `TravelMode`.
public enum TravelType: Codable {
    case drive(VehicleType)
    case pedestrian(PedestrianType)
    case bicycle(BicycleType)
    case transit(TransitType)
}
