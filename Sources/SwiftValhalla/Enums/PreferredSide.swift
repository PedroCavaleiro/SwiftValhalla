//
//  PreferredSide.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Indicates the preferred side relative to a reference (for example,
/// which side of the road a route or asset prefers).
public enum PreferredSide: String, Codable, Sendable {
    /// Prefer the same side as the reference.
    case same = "same"
    /// Prefer the opposite side from the reference.
    case opposite = "opposite"
    /// Either side is acceptable.
    case either = "either"
}
