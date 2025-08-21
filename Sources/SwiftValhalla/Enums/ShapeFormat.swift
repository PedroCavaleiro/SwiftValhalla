//
//  ShapeFormat.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Specifies the optional format for the path shape of each connection
/// - Note: Only if `format` is set to `osrm`
public enum ShapeFormat: String, Codable {
    case polyline6 = "polyline6"
    case polyline5 = "polyline5"
    case geoJson = "geojson"
    case noShape = "no_shape"
}
