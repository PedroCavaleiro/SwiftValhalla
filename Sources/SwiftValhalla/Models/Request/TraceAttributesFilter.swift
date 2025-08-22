//
//  TraceAttributesFilter.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// The structure that represents the trace attributes filters
/// - Parameters:
///   - action: Sets the filter to include or exclude the defined attributes
///   - attributes: The attributes to include or exclude
public struct TraceAttributesFilter: Codable, Sendable {
    
    public let action: Action
    public let attributes: [Filter]
    
    /// Initializer:
    /// - Parameters:
    ///   - action: Sets the filter to include or exclude the defined attributes
    ///   - attributes: The attributes to include or exclude
    public init(_ action: Action, attributes: [Filter]) {
        self.action = action
        self.attributes = attributes
    }
    
    /// Generates a `TraceAttributesFilter` including all attributes
    public static func all() -> TraceAttributesFilter {
        .init(.include, attributes: Filter.allCases)
    }
    
    /// Generates a `TraceAttributesFilter` excluding all attributes
    public static func none() -> TraceAttributesFilter {
        .init(.exclude, attributes: Filter.allCases)
    }
    
    enum CodingKeys: String, CodingKey {
        case action = "action"
        case attributes = "attributes"
    }
    
}
