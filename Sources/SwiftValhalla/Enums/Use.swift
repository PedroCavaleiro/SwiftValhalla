//
//  Use.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents the different use types for edges or paths in Valhalla routing.
///
/// Each case corresponds to a specific way or connection type (e.g., road, ramp, ferry).
/// The raw value matches the exact key string used in Valhalla.
///
/// Conforms to `Codable` for serialization, and `CaseIterable` for iteration.
public enum Use: String, Codable, CaseIterable {
    case tram = "tram"
    case road = "road"
    case ramp = "ramp"
    case turnChannel = "turn_channel"
    case track = "track"
    case driveway = "driveway"
    case alley = "alley"
    case parkingAisle = "parking_aisle"
    case emergencyAccess = "emergency_access"
    case driveThrough = "drive_through"
    case culdesac = "culdesac"
    case cycleway = "cycleway"
    case mountainBike = "mountain_bike"
    case sidewalk = "sidewalk"
    case footway = "footway"
    case steps = "steps"
    case other = "other"
    case railFerry = "rail-ferry"
    case ferry = "ferry"
    case rail = "rail"
    case bus = "bus"
    case egressConnection = "egress_connection"
    case platformConnection = "platform_connection"
    case transitConnection = "transit_connection"
}
