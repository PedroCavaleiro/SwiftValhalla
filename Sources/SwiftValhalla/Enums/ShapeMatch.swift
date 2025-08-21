//
//  ShapeMatch.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// It allows some control of the matching algorithm based on the type of input.
public enum ShapeMatch: String, Codable, Sendable {
    /// Indicates an edge walking algorithm can be used. This algorithm requires nearly exact shape matching, so it should only be used when the shape is from a prior Valhalla route.
    case edgeWalk = "edge_walk"
    /// Indicates that a map-matching algorithm should be used because the input shape might not closely match Valhalla edges. This algorithm is more expensive.
    case mapSnap = "map_snap"
    /// Also the default option. This will try edge walking and if this does not succeed, it will fall back and use map matching.
    case walkOrSnap = "walk_or_snap"
}
