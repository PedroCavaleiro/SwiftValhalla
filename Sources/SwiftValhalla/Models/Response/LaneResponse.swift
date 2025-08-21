//
//  LaneResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents a road lane with its supported directions and metadata about
/// whether the lane is currently active or valid for a maneuver.
///
/// - Parameters:
///   - directions: The directions that the lane supports.
///   - active: The currently active direction(s) for the lane, if any.
///   - valid: The direction(s) considered valid for the maneuver, if any.
public struct Lane: Codable {
    public let directions: LaneDirection
    public let active: LaneDirection?
    public let valid: LaneDirection?
}
