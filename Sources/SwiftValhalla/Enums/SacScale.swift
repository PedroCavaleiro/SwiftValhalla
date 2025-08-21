//
//  SacScale.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the SAC (Swiss Alpine Club) scale for hiking difficulty.
///
/// Each case corresponds to a specific level of hiking difficulty.
/// The raw value matches the numeric string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum SacScale: String, Codable, CaseIterable {
    /// No Sac Scale
    case noSacScale = "0"
    /// Hiking
    case hiking = "1"
    /// Mountain hiking
    case mountainHiking = "2"
    /// Demanding mountain hiking
    case demandingMountainHiking = "3"
    /// Alpine hiking
    case alpineHiking = "4"
    /// Demanding alpine hiking
    case demandingAlpineHiking = "5"
    /// Difficult alpine hiking
    case difficultAlpineHiking = "6"
}
