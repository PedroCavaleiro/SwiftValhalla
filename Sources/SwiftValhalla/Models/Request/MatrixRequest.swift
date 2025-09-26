//
//  MatrixRequest.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import MapKit
import Foundation

/// A request structure for calculating travel time and distance matrices between multiple locations.
///
/// Use `MatrixRequest` to compute one-to-many, many-to-one, or many-to-many matrices that provide
/// travel times and distances between locations. This is useful for applications like:
/// - Route optimization
/// - Delivery planning
/// - Location analysis
/// - Travel time calculations
///
/// ## Basic Usage
///
/// ```swift
/// let sources = [
///     Location(latitude: 40.7128, longitude: -74.0060), // New York
///     Location(latitude: 34.0522, longitude: -118.2437)  // Los Angeles
/// ]
/// 
/// let targets = [
///     Location(latitude: 41.8781, longitude: -87.6298), // Chicago
///     Location(latitude: 29.7604, longitude: -95.3698)  // Houston
/// ]
/// 
/// let request = MatrixRequest(
///     sources: sources,
///     targets: targets,
///     costing: .auto,
///     units: .kilometers
/// )
/// ```
///
/// ## Using Vehicle Location Protocol
///
/// You can also create requests from objects conforming to `LocationProtocol`:
///
/// ```swift
/// struct Vehicle: LocationProtocol {
///     let location: CLLocationCoordinate2D
/// }
/// 
/// let vehicles = [Vehicle(location: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060))]
/// let request = MatrixRequest(sources: vehicles, costing: .auto)
/// ```
///
/// - Note: If `targets` is not provided, the `sources` array will be used as both sources and targets,
///   creating a symmetric matrix.
public struct MatrixRequest: Codable, Sendable {
    
    /// Array of source locations for the matrix calculation.
    ///
    /// These represent the starting points for travel time and distance calculations.
    public let sources: [Location]
    
    /// Array of target locations for the matrix calculation.
    ///
    /// These represent the destination points for travel time and distance calculations.
    /// If `nil`, the `sources` array will be used as targets, creating a symmetric matrix.
    public let targets: [Location]?
    
    /// The costing model to use for route calculations.
    ///
    /// Different costing models optimize for different vehicle types and travel preferences.
    /// Defaults to `.auto` for standard automobile routing.
    public let costing: CostingModel
    
    /// Additional options specific to the chosen costing model.
    ///
    /// Use this to configure routing preferences such as avoiding tolls, highways,
    /// or setting vehicle specifications for truck routing.
    public let costingOptions: CostingOptions?
    
    /// Distance units for the response output.
    ///
    /// When specified, all distance values in the response will use these units.
    /// If `nil`, distances default to kilometers.
    public let units: Unit?
    
    /// Whether to return verbose output with additional information.
    ///
    /// When `true`, the response may include additional debugging or detailed information.
    /// When `false` or `nil`, returns standard matrix output.
    public let verbose: Bool?
    
    /// Maximum number of locations allowed in the matrix calculation.
    ///
    /// This can be used to limit the size of the matrix calculation. If the total number
    /// of source and target locations exceeds this value, the request may be rejected.
    public let matrixLocations: Int?
    
    /// Coordinate encoding format for any returned route shapes.
    ///
    /// Specifies how coordinate data should be encoded in the response if route shapes
    /// are included in the matrix output.
    public let shape: ShapeFormat?
    
    /// Filters to apply to the response attributes.
    ///
    /// Use this to control which attributes are included in or excluded from the response,
    /// helping to reduce response size and processing time.
    public let filters: TraceAttributesFilter?
    
    /// Whether to prioritize calculations by time or distance.
    ///
    /// When set to `.time`, the matrix will optimize for fastest routes.
    /// When set to `.distance`, the matrix will optimize for shortest routes.
    public let prioritizeBy: PriorityType?
    
    /// Indices of locations to exclude from the matrix calculation.
    ///
    /// Use this to exclude specific source or target locations from the calculation
    /// without removing them from the arrays. Indices refer to positions in the
    /// combined sources and targets arrays.
    public let excludeLocations: [Int]?
    
    /// Creates a matrix request with the specified parameters.
    ///
    /// - Parameters:
    ///   - sources: Array of source locations for the matrix calculation.
    ///   - targets: Array of target locations. If `nil`, sources are used as targets.
    ///   - costing: Costing model for route calculations. Defaults to `.auto`.
    ///   - costingOptions: Additional costing-specific options. Defaults to `nil`.
    ///   - units: Distance units for output. Defaults to `nil` (kilometers).
    ///   - verbose: Whether to return verbose output. Defaults to `nil`.
    ///   - matrixLocations: Maximum number of locations allowed. Defaults to `nil`.
    ///   - shape: Coordinate encoding format for shapes. Defaults to `nil`.
    ///   - filters: Response attribute filters. Defaults to `nil`.
    ///   - prioritizeBy: Whether to prioritize by time or distance. Defaults to `nil`.
    ///   - excludeLocations: Indices of locations to exclude. Defaults to `nil`.
    public init(
        sources: [Location],
        targets: [Location]? = nil,
        costing: CostingModel = .auto,
        costingOptions: CostingOptions? = nil,
        units: Unit? = nil,
        verbose: Bool? = nil,
        matrixLocations: Int? = nil,
        shape: ShapeFormat? = nil,
        filters: TraceAttributesFilter? = nil,
        prioritizeBy: PriorityType? = nil,
        excludeLocations: [Int]? = nil
    ) {
        self.sources = sources
        self.targets = targets
        self.costing = costing
        self.costingOptions = costingOptions
        self.units = units
        self.verbose = verbose
        self.matrixLocations = matrixLocations
        self.shape = shape
        self.filters = filters
        self.prioritizeBy = prioritizeBy
        self.excludeLocations = excludeLocations
    }
    
    /// Creates a matrix request from objects conforming to `LocationProtocol`.
    ///
    /// This convenience initializer allows you to create matrix requests directly from
    /// custom objects that conform to `LocationProtocol`, such as vehicle or
    /// delivery location models.
    ///
    /// - Parameters:
    ///   - sources: Array of objects conforming to `LocationProtocol` as source locations.
    ///   - targets: Array of objects conforming to `LocationProtocol` as target locations.
    ///     If `nil`, sources are used as targets.
    ///   - costing: Costing model for route calculations. Defaults to `.auto`.
    ///   - costingOptions: Additional costing-specific options. Defaults to `nil`.
    ///   - units: Distance units for output. Defaults to `nil` (kilometers).
    ///   - verbose: Whether to return verbose output. Defaults to `nil`.
    ///   - matrixLocations: Maximum number of locations allowed. Defaults to `nil`.
    ///   - shape: Coordinate encoding format for shapes. Defaults to `nil`.
    ///   - filters: Response attribute filters. Defaults to `nil`.
    ///   - prioritizeBy: Whether to prioritize by time or distance. Defaults to `nil`.
    ///   - excludeLocations: Indices of locations to exclude. Defaults to `nil`.
    public init<S: LocationProtocol, T: LocationProtocol>(
        sources: [S],
        targets: [T]? = nil,
        costing: CostingModel = .auto,
        costingOptions: CostingOptions? = nil,
        units: Unit? = nil,
        verbose: Bool? = nil,
        matrixLocations: Int? = nil,
        shape: ShapeFormat? = nil,
        filters: TraceAttributesFilter? = nil,
        prioritizeBy: PriorityType? = nil,
        excludeLocations: [Int]? = nil
    ) {
        self.sources = sources.map { Location(latitude: $0.location.latitude, longitude: $0.location.longitude) }
        self.targets = targets?.map { Location(latitude: $0.location.latitude, longitude: $0.location.longitude) }
        self.costing = costing
        self.costingOptions = costingOptions
        self.units = units
        self.verbose = verbose
        self.matrixLocations = matrixLocations
        self.shape = shape
        self.filters = filters
        self.prioritizeBy = prioritizeBy
        self.excludeLocations = excludeLocations
    }
    
    /// Creates a matrix request from objects conforming to `LocationProtocol`.
    ///
    /// This convenience initializer allows you to create matrix requests directly from
    /// custom objects that conform to `LocationProtocol`, such as vehicle or
    /// delivery location models.
    ///
    /// - Parameters:
    ///   - sources: Array of objects conforming to `LocationProtocol` as source locations.
    ///   - targets: Array of objects conforming to `LocationProtocol` as target locations.
    ///     If `nil`, sources are used as targets.
    ///   - costing: Costing model for route calculations. Defaults to `.auto`.
    ///   - costingOptions: Additional costing-specific options. Defaults to `nil`.
    ///   - units: Distance units for output. Defaults to `nil` (kilometers).
    ///   - verbose: Whether to return verbose output. Defaults to `nil`.
    ///   - matrixLocations: Maximum number of locations allowed. Defaults to `nil`.
    ///   - shape: Coordinate encoding format for shapes. Defaults to `nil`.
    ///   - filters: Response attribute filters. Defaults to `nil`.
    ///   - prioritizeBy: Whether to prioritize by time or distance. Defaults to `nil`.
    ///   - excludeLocations: Indices of locations to exclude. Defaults to `nil`.
    public init(
        sources: [CLLocationCoordinate2D],
        targets: [CLLocationCoordinate2D]? = nil,
        costing: CostingModel = .auto,
        costingOptions: CostingOptions? = nil,
        units: Unit? = nil,
        verbose: Bool? = nil,
        matrixLocations: Int? = nil,
        shape: ShapeFormat? = nil,
        filters: TraceAttributesFilter? = nil,
        prioritizeBy: PriorityType? = nil,
        excludeLocations: [Int]? = nil
    ) {
        self.sources = sources.map { Location(latitude: $0.latitude, longitude: $0.longitude) }
        self.targets = targets?.map { Location(latitude: $0.latitude, longitude: $0.longitude) }
        self.costing = costing
        self.costingOptions = costingOptions
        self.units = units
        self.verbose = verbose
        self.matrixLocations = matrixLocations
        self.shape = shape
        self.filters = filters
        self.prioritizeBy = prioritizeBy
        self.excludeLocations = excludeLocations
    }
    
    /// Coding keys for JSON serialization and deserialization.
    ///
    /// Maps Swift property names to their corresponding JSON keys used in the Valhalla Matrix API.
    enum CodingKeys: String, CodingKey {
        case sources = "sources"
        case targets = "targets"
        case costing = "costing"
        case costingOptions = "costing_options"
        case units = "units"
        case verbose = "verbose"
        case matrixLocations = "matrix_locations"
        case shape = "shape"
        case filters = "filters"
        case prioritizeBy = "prioritize_by"
        case excludeLocations = "exclude_locations"
    }
}
