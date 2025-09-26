//
//  LocationProtocol.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation
import MapKit

/// A protocol for types that expose a geographic location.
///
/// Conforming types provide a `location` coordinate, typically representing
/// the entity’s current or canonical position on Earth.
///
/// ### Example
/// ```swift
/// struct Vehicle: LocationProtocol {
///     var location: CLLocationCoordinate2D
/// }
/// ```
///
/// - Tag: LocationProtocol
public protocol LocationProtocol: Codable {
    /// The geographic coordinate of the instance.
    ///
    /// The coordinate uses the WGS 84 datum and represents latitude and longitude
    /// in degrees.
    ///
    /// - SeeAlso: ``CLLocationCoordinate2D``
    var location: CLLocationCoordinate2D { get }
}
