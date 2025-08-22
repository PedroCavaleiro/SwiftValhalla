//
//  MapMatchingRequest.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// The structure for the Map Matching request
/// - Parameters:
///   - shape: The shape to match
///   - encodedPolyline: The polyline to match
///   - shapeMatch: Allows some control of the matching algorithm based on the type of input.
///   - costing: Valhalla Map Matching can use any costing model available in the Valhalla route service
///   - useTimestamps: A boolean value indicating whether the input timestamps or durations should be used when computing elapsed time at each edge along the matched path. If true, timestamps are used. If false (default), internal costing is applied to compute elapsed times.
///   - directionsOptions: Specify units, language, and whether or not to return directions in a narrative form.
///   - traceOptions: Trace options to improve results
///   - beginTime: Begin timestamp for the trace. This is used along with the `durations` so that timestamps can be specified for a trace that is specified using an encoded polyline.
///   - durations: List of durations (seconds) between each successive pair of input trace points. This allows trace points to be supplied as an encoded polyline and timestamps to be created by using this list of "delta" times along with the `beginTime` of the trace.
///   - filters: The trace attributes filters for this request
///
/// - Note: Although `shape` and `encodedPolyline` are optional one of them must be provided otherwise a `fatalError` will be thrown. If both are provided `shape` will take precedence.
public struct MapMatchingRequest: Codable, Sendable {
    
    public let shape: [Location]?
    public let encodedPolyline: String?
    public let shapeMatch: ShapeMatch
    public let costing: CostingModel
    public let useTimestamps: Bool
    public let directionsOptions: DirectionsOptions?
    public let traceOptions: TraceOptions?
    public let beginTime: Int?
    public let durations: [Int]?
    public let filters: TraceAttributesFilter?
    
    /// The structure for the Map Matching request
    /// - Parameters:
    ///   - shape: The shape to match
    ///   - encodedPolyline: The polyline to match
    ///   - shapeMatch: Allows some control of the matching algorithm based on the type of input.
    ///   - costing: Valhalla Map Matching can use any costing model available in the Valhalla route service
    ///   - useTimestamps: A boolean value indicating whether the input timestamps or durations should be used when computing elapsed time at each edge along the matched path. If true, timestamps are used. If false (default), internal costing is applied to compute elapsed times.
    ///   - traceOptions: Options to improve results
    ///   - beginTime: Begin timestamp for the trace. This is used along with the `durations` so that timestamps can be specified for a trace that is specified using an encoded polyline.
    ///   - durations: List of durations (seconds) between each successive pair of input trace points. This allows trace points to be supplied as an encoded polyline and timestamps to be created by using this list of "delta" times along with the `beginTime` of the trace.
    ///   - filters: The trace attributes filters for this request
    ///
    /// - Note: Although `shape` and `encodedPolyline` are optional one of them must be provided otherwise a `fatalError` will be thrown. If both are provided `shape` will take precedence.
    public init(
        shape: [Location]? = nil,
        encodedPolyline: String? = nil,
        shapeMatch: ShapeMatch = ShapeMatch.walkOrSnap,
        costing: CostingModel = CostingModel.auto,
        useTimestamps: Bool = false,
        directionsOptions: DirectionsOptions? = nil,
        traceOptions: TraceOptions? = nil,
        beginTime: Int? = nil,
        durations: [Int]? = nil,
        filters: TraceAttributesFilter? = nil
    ) {
        //self.shape = shape
        self.shapeMatch = shapeMatch
        self.costing = costing
        self.useTimestamps = useTimestamps
        self.directionsOptions = directionsOptions
        self.traceOptions = traceOptions
        self.filters = filters
        
        if let durations = durations, let beginTime = beginTime {
            self.durations = durations
            self.beginTime = beginTime
        } else {
            self.durations = nil
            self.beginTime = nil
        }
        
        if let shape = shape {
            self.encodedPolyline = nil
            self.shape = shape
        } else if let encodedPolyline = encodedPolyline {
            self.encodedPolyline = encodedPolyline
            self.shape = nil
        } else {
            fatalError("Must supply either shape or encodedPolyline")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case shape = "shape"
        case encodedPolyline = "encoded_polyline"
        case shapeMatch = "shape_match"
        case costing = "costing"
        case useTimestamps = "use_timestamps"
        case directionsOptions = "directions_options"
        case traceOptions = "trace_options"
        case durations = "durations"
        case beginTime = "begin_time"
        case filters = "filters"
    }
    
}
