//
//  DirectionType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Indicates the type of directions or instructions to be returned.
public enum DirectionType: String, Codable, Sendable {
    
    /// Indicating no maneuvers or instructions should be returned.
    case none = "none"
    /// Indicating that only maneuvers be returned.
    case maneuvers = "maneuvers"
    /// Indicating that maneuvers with instructions should be returned (this is the default if not specified).
    case instructions = "instructions"
    
}
