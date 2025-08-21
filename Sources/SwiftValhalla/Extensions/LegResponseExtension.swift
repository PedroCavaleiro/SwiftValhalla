//
//  LegResponseExtension.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation
import MapKit

extension LegResponse {
    
    var coordinates: [CLLocationCoordinate2D] {
        guard let shape = self.shape else { return [] }
        return decodePolylineShape(shape, precision: 6)
    }
    
}
