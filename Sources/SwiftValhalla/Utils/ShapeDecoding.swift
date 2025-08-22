//
//  ShapeDecoding.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation
import MapKit

/// Decodes a Valhalla/Google-style polyline-encoded string into an array of geographic coordinates.
/// This was converted from the Python sample in the valhalla docs: https://valhalla.github.io/valhalla/decoding/#python
///
/// This function takes an encoded polyline string (where latitude and longitude
/// values are stored as variable-length sequences of characters) and reconstructs
/// the original sequence of coordinates. Each coordinate is returned as a
/// `CLLocationCoordinate2D`, with longitude first and latitude second,
/// scaled according to the given precision.
///
/// - Parameters:
///   - encoded: The encoded polyline string to decode.
///   - precision: The scaling factor used when encoding coordinates.
///     Defaults to `1.0 / 1e6`, which corresponds to six decimal places of precision.
/// - Returns: An array of `CLLocationCoordinate2D` objects representing the decoded path,
///   ordered in the sequence they appear in the encoded string.
internal func decodePolylineShape(_ encoded: String, precision: Double = 1e-6) -> [CLLocationCoordinate2D] {
    var decoded: [CLLocationCoordinate2D] = []
    var previous = (lat: 0, lon: 0)
    var i = encoded.startIndex
    
    while i < encoded.endIndex {
        var coord = (lat: 0, lon: 0)
        
        for j in 0...1 {
            var shift = 0
            var result = 0
            var byte: Int
            
            repeat {
                byte = Int(encoded[i].asciiValue!) - 63
                i = encoded.index(after: i)
                result |= (byte & 0x1f) << shift
                shift += 5
            } while byte >= 0x20
            
            let delta = (result & 1) != 0 ? ~(result >> 1) : (result >> 1)
            if j == 0 {
                coord.lat = previous.lat + delta
                previous.lat = coord.lat
            } else {
                coord.lon = previous.lon + delta
                previous.lon = coord.lon
            }
        }
        
        let lat = Double(coord.lat) * precision
        let lon = Double(coord.lon) * precision
        decoded.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
    }
    
    return decoded
}

