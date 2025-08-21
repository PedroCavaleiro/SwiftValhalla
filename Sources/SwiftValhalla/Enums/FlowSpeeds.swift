//
//  FlowSpeeds.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the different flow speed types for edges in Valhalla routing.
///
/// Each case corresponds to a specific traffic flow condition.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum FlowSpeeds: String, Codable, CaseIterable {
    case currentFlow = "current_flow"
    case constrainedFlow = "constrained_flow"
    case freeFlow = "free_flow"
    case predictedFlow = "predicted_flow"
    case noFlow = "no_flow"
}
