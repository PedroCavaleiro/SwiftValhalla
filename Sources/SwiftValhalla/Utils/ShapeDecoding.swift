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
internal func decodePolylineShape(_ encoded: String, precision: Double = 1.0/1e6) -> [CLLocationCoordinate2D] {
    var decoded: [CLLocationCoordinate2D] = []
    var previous: [Int] = [0, 0]
    var i = encoded.startIndex
    
    while i < encoded.endIndex {
        var ll: [Int] = [0, 0]
        
        for j in 0...1 {
            var shift = 0
            var byte = 0x20
            
            while byte >= 0x20 {
                let scalar = encoded[i].unicodeScalars.first!.value
                byte = Int(scalar) - 63
                i = encoded.index(after: i)
                
                ll[j] |= (byte & 0x1f) << shift
                shift += 5
            }
                        
            if (ll[j] & 1) != 0 {
                ll[j] = previous[j] + ~(ll[j] >> 1)
            } else {
                ll[j] = previous[j] + (ll[j] >> 1)
            }
            
            previous[j] = ll[j]
        }
        
        let lon = Double(ll[1]) * precision
        let lat = Double(ll[0]) * precision
        
        let lonRounded = Double(String(format: "%.6f", lon)) ?? lon
        let latRounded = Double(String(format: "%.6f", lat)) ?? lat
        
        decoded.append(CLLocationCoordinate2D(latitude: latRounded, longitude: lonRounded))
    }
    
    return decoded
}
