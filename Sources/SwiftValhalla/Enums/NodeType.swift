//
//  NodeType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents different types of nodes in Valhalla routing.
///
/// Each case corresponds to a specific type of node or intersection.
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum NodeType: String, Codable, CaseIterable {
    case streetIntersection = "street_intersection"
    case gate = "gate"
    case bollard = "bollard"
    case tollBooth = "toll_booth"
    case multiUseTransitStop = "multi_use_transit_stop"
    case bikeShare = "bike_share"
    case parking = "parking"
    case motorWayJunction = "motor_way_junction"
    case borderControl = "border_control"
}
