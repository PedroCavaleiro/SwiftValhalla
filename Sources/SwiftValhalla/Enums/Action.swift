//
//  Action.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Indicates whether an item should be included or excluded when applying
/// filters or similar operations.
public enum Action: String, Codable {
    /// Include the item when applying the filter.
    case include = "include"
    /// Exclude the item when applying the filter.
    case exclude = "exclude"
}
