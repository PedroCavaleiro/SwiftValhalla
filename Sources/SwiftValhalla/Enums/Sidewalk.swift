//
//  Sidewalk.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

public typealias SideOfStreet = Sidewalk

/// Represents the presence and location of sidewalks for edges in Valhalla routing.
///
/// Each case corresponds to the sidewalk position relative to the edge.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum Sidewalk: String, Codable, CaseIterable, Sendable {
    case left = "left"
    case right = "right"
    case both = "both"
}
