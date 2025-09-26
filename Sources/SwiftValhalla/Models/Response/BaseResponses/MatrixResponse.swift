//
//  MatrixResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation
import SwiftlyRest

typealias MatrixCall = Result<MatrixResponse, SwiftlyRestError>

/// Represents the response from the Valhalla Matrix API.
/// 
/// The matrix service computes time and distance between many origins and destinations,
/// returning the results in matrix format. The response includes source and target
/// locations along with the computed matrices.
///
/// ## Overview
///
/// The matrix response contains arrays of source and target locations used in the computation,
/// along with matrices showing the travel time and distance between each source-target pair.
/// If bidirectional routing was requested, both source-to-target and target-to-source matrices
/// will be included.
///
/// ## Example Usage
///
/// ```swift
/// // Creating a matrix response
/// let response = MatrixResponse(
///     sources: sourceLocations,
///     targets: targetLocations,
///     sourcesToTargets: [[matrixElement1, matrixElement2]],
///     units: "kilometers"
/// )
/// 
/// // Accessing results
/// let travelTime = response.sourcesToTargets[0][1]?.time
/// let distance = response.sourcesToTargets[0][1]?.distance
/// ```
///
/// - Note: Matrix elements can be `nil` if no route could be found between the corresponding
///   source and target locations.
public struct MatrixResponse: Codable, Sendable {
    
    /// Array of source locations used in the matrix computation.
    ///
    /// These locations represent the starting points for route calculations.
    /// The order of sources corresponds to the first dimension of the ``sourcesToTargets`` matrix.
    public let sources: [Location]
    
    /// Array of target locations used in the matrix computation.
    ///
    /// These locations represent the destinations for route calculations.
    /// The order of targets corresponds to the second dimension of the ``sourcesToTargets`` matrix.
    public let targets: [Location]
    
    /// Matrix of results from sources to targets.
    ///
    /// A two-dimensional array where `sourcesToTargets[i][j]` represents the result from
    /// source `i` to target `j`. Each element contains travel time and distance information,
    /// or `nil` if no route could be found.
    ///
    /// - Important: The dimensions of this matrix are `[sources.count][targets.count]`.
    public let sourcesToTargets: [[MatrixElement?]]
    
    /// Optional matrix of results from targets to sources.
    ///
    /// Only present if `bidirectional=true` was specified in the request.
    /// A two-dimensional array where `targetsToSources[i][j]` represents the result from
    /// target `i` to source `j`.
    ///
    /// - Note: This property will be `nil` unless bidirectional routing was explicitly requested.
    public let targetsToSources: [[MatrixElement?]]?
    
    /// The distance units used in the response.
    ///
    /// Possible values:
    /// - `"kilometers"` - Distances in kilometers
    /// - `"miles"` - Distances in miles
    public let units: Unit
    
    /// Optional encoded polyline shape.
    ///
    /// Only present when shape output was requested in the original request.
    /// The shape is encoded using the specified encoding format (typically polyline5 or polyline6).
    public let shape: String?
    
    /// Optional array of warning messages.
    ///
    /// Contains any warnings generated during the matrix computation process.
    /// These might include information about locations that couldn't be matched
    /// to the road network or other non-fatal issues.
    public let warnings: [String]?
    
    /// Optional request identifier for tracking purposes.
    ///
    /// Can be used to correlate requests and responses in logging or debugging scenarios.
    public let id: String?
    
    /// Creates a new matrix response.
    ///
    /// - Parameters:
    ///   - sources: Array of source locations used in the matrix computation
    ///   - targets: Array of target locations used in the matrix computation
    ///   - sourcesToTargets: Matrix of results from sources to targets
    ///   - targetsToSources: Optional matrix of results from targets to sources (only present if bidirectional=true)
    ///   - units: The distance units used in the response (defaults to "kilometers")
    ///   - shape: Optional encoded polyline shape (only present when shape is requested)
    ///   - warnings: Optional array of warning messages
    ///   - id: Optional request identifier for tracking
    public init(
        sources: [Location],
        targets: [Location],
        sourcesToTargets: [[MatrixElement?]],
        targetsToSources: [[MatrixElement?]]? = nil,
        units: Unit = .kilometers,
        shape: String? = nil,
        warnings: [String]? = nil,
        id: String? = nil
    ) {
        self.sources = sources
        self.targets = targets
        self.sourcesToTargets = sourcesToTargets
        self.targetsToSources = targetsToSources
        self.units = units
        self.shape = shape
        self.warnings = warnings
        self.id = id
    }
    
    /// Coding keys for JSON serialization.
    ///
    /// Maps Swift property names to their corresponding JSON keys in the Valhalla API response.
    enum CodingKeys: String, CodingKey {
        case sources
        case targets
        case sourcesToTargets = "sources_to_targets"
        case targetsToSources = "targets_to_sources"
        case units
        case shape
        case warnings
        case id
    }
}
