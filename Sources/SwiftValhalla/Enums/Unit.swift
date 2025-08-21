//
//  Unit.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Distance units for output. Allowable unit types are miles (or mi) and kilometers (or km). If no unit type is specified, the units default to kilometers.
public enum Unit: String, Codable, Sendable {
    
    case miles = "mi"
    case kilometers = "km"
    
}
