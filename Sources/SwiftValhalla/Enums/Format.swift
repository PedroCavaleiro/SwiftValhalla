//
//  File.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Directions response format
public enum Format: String, Codable, Sendable {
    /// Is default valhalla routing directions JSON format
    case json = "json"
    /// Returns the route as a GPX (GPS exchange format) XML track
    case gpx = "gpx"
    /// Creates a OSRM compatible route directions JSON
    case osrm = "osrm"
    /// Formats the result using protocol buffers
    case pbf = "pbf"
}
