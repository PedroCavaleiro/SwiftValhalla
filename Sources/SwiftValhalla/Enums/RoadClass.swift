//
//  RoadClass.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 20/08/2025.
//

import Foundation

/// Classification of roads by importance or hierarchy used in routing.
public enum RoadClass: String, Codable, Sendable {
    case motorway = "motorway"
    case trunk = "trunk"
    case primary = "primary"
    case secondary = "secondary"
    case tertiary = "tertiary"
    case unclassified = "unclassified"
    case residential = "residential"
    case serviceOther = "service_other"
}
