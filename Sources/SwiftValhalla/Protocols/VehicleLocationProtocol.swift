//
//  VehicleLocationProtocol.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation
import MapKit

public protocol VehicleLocationProtocol: Codable {
    var location: CLLocationCoordinate2D { get }
}
