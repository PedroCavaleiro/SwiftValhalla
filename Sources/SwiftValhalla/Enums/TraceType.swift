//
//  TraceType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Each type controls two characteristics: whether or not to allow a u-turn at the location and whether or not to generate guidance/legs at the location.
public enum TraceType: String, Codable, Sendable {
    /// A break is a location at which we allows u-turns and generate legs and arrival/departure maneuvers.
    case `break` = "break"  // Fixed: Use proper backticks
    /// A via location is a location at which we allow u-turns but do not generate legs or arrival/departure maneuvers.
    case via = "via"
    /// A through location is a location at which we neither allow u-turns nor generate legs or arrival/departure maneuvers.
    case through = "through"
    /// A breakThrough location is a location at which we do not allow u-turns but do generate legs and arrival/departure maneuvers.
    case breakThrough = "break_through"
}
