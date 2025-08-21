//
//  Surface.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the different surface types for edges in Valhalla routing.
///
/// Each case corresponds to a specific surface quality or condition.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum Surface: String, Codable, CaseIterable {
    case pavedSmooth = "paved_smooth"
    case paved = "paved"
    case pavedRough = "paved_rough"
    case compacted = "compacted"
    case dirt = "dirt"
    case gravel = "gravel"
    case path = "path"
    case impassable = "impassable"
}
