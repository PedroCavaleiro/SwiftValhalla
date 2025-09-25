//
//  Coordinates.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation
import MapKit

/// A representation of geographic coordinates with latitude and longitude values.
///
/// `Coordinates` provides a simple way to store and work with geographic coordinate data,
/// supporting both direct coordinate values and conversion from Core Location types.
/// The class conforms to `Codable` for easy serialization and deserialization.
///
/// ## Usage
///
/// Create coordinates directly:
/// ```swift
/// let coords = Coordinates(latitude: 37.7749, longitude: -122.4194)
/// ```
///
/// Or convert from Core Location:
/// ```swift
/// let clCoords = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
/// let coords = Coordinates(coordinates: clCoords)
/// ```
///
/// ## JSON Representation
///
/// When encoded to JSON, coordinates use shortened property names:
/// - `latitude` becomes `"lat"`
/// - `longitude` becomes `"lon"`
public struct Coordinates: Codable {
    
    /// The latitude coordinate in degrees.
    ///
    /// Valid latitude values range from -90.0 to +90.0 degrees,
    /// where negative values represent southern latitudes.
    public let latitude: Double
    
    /// The longitude coordinate in degrees.
    ///
    /// Valid longitude values range from -180.0 to +180.0 degrees,
    /// where negative values represent western longitudes.
    public let longitude: Double
    
    /// Creates a new coordinate instance with the specified latitude and longitude.
    ///
    /// - Parameters:
    ///   - latitude: The latitude coordinate in degrees (-90.0 to +90.0)
    ///   - longitude: The longitude coordinate in degrees (-180.0 to +180.0)
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    /// Creates a new coordinate instance from a Core Location coordinate.
    ///
    /// This convenience initializer allows easy conversion from Core Location's
    /// `CLLocationCoordinate2D` type to the `Coordinates` class.
    ///
    /// - Parameter coordinates: A `CLLocationCoordinate2D` instance containing
    ///   the latitude and longitude values to copy
    public init(coordinates: CLLocationCoordinate2D) {
        self.latitude = coordinates.latitude
        self.longitude = coordinates.longitude
    }
    
    /// Coding keys for JSON serialization.
    ///
    /// Maps the Swift property names to their JSON representations:
    /// - `latitude` ↔ `"lat"`
    /// - `longitude` ↔ `"lon"`
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
    
}
