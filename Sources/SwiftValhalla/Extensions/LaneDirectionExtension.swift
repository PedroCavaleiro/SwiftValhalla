//
//  LaneDirection.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Utility extension for `LaneDirection` providing convenience collections
/// and readable descriptions for direction bitmasks used by lane models.
///
/// This extension adds:
/// - a static `allCases` array enumerating known directions,
/// - a `components` property that extracts individual directions from a bitmask,
/// - a `description` property that returns a human-readable representation.
///
/// - Note: These helpers are intended for display and debugging; they do not
///   modify the underlying bitmask semantics.
extension LaneDirection {
    
    public static let allCases: [LaneDirection] = [
        .none,
        .through,
        .sharpLeft,
        .left,
        .slightLeft,
        .slightRight,
        .right,
        .sharpRight,
        .reverse,
        .mergeToLeft,
        .mergeToRight
    ]
    
    /// Returns all directions contained in this bitmask
    public var components: [LaneDirection] {
        Self.allCases.filter { self.contains($0) }
    }
    
    public var description: String {
        var parts: [String] = []
        
        if contains(.none)         { parts.append("None") }
        if contains(.through)      { parts.append("Through") }
        if contains(.sharpLeft)    { parts.append("SharpLeft") }
        if contains(.left)         { parts.append("Left") }
        if contains(.slightLeft)   { parts.append("SlightLeft") }
        if contains(.slightRight)  { parts.append("SlightRight") }
        if contains(.right)        { parts.append("Right") }
        if contains(.sharpRight)   { parts.append("SharpRight") }
        if contains(.reverse)      { parts.append("Reverse") }
        if contains(.mergeToLeft)  { parts.append("MergeToLeft") }
        if contains(.mergeToRight) { parts.append("MergeToRight") }

        return parts.isEmpty ? "Empty" : parts.joined(separator: " + ")
    }
}
