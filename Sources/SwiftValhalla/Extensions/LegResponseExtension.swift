//
//  LegResponseExtension.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation
import MapKit

extension LegResponse {
    
    /// Fetches the coordinates from a shape allowing a custom precision
    /// - Parameter precision: The precision of the coordinates defaulting to 1e-6
    /// - Returns: A array of CLLocationCoordinate2D
    public func getCoordinates(precision: Double = 1e-6) -> [CLLocationCoordinate2D] {
        guard let shape = self.shape else { return [] }
        return decodePolylineShape(shape, precision: precision)
    }
    
    /// Fetches the coordinates from a shape with the default precision
    /// This is a computed variable instead of a function for improved performance
    /// - Returns: A array of CLLocationCoordinate2D
    public var coordinates: [CLLocationCoordinate2D] {
        guard let shape = self.shape else { return [] }
        return decodePolylineShape(shape, precision: 1e-6)
    }
    
}
