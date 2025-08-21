//
//  MatchedType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the possible states of a location when aligning a trace to the road network.
public enum MatchType: String, Codable, CaseIterable {
    /// The trace point could not be aligned to any road segment.
    case unmatched = "unmatched"
    
    /// The trace point was interpolated between known matched points.
    case interpolated = "interpolated"
    
    /// The trace point was successfully matched to a road segment.
    case matched = "matched"
}
