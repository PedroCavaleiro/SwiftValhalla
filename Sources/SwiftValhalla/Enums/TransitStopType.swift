//
//  File.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the kind of transit stop: a simple stop or a station.
public enum TransitStopType: Int, Codable {
    /// A simple stop (e.g., a single platform or stop sign).
    case simpleStop = 0
    /// A station with multiple platforms or facilities.
    case station = 1
}
