//
//  SearchFilter.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 20/08/2025.
//

import Foundation

/// A set of optional filters to exclude candidate edges based on their attribution.
/// - Parameters:
///   - excludeTunnel: Whether to exclude roads marked as tunnels
///   - excludeBridge: Whether to exclude roads marked as bridges
///   - excludeToll: Whether to exclude toll
///   - excludeFerry: Whether to exclude ferry
///   - excludeRamp: Whether to exclude link roads marked as ramps, note that some turn channels are also marked as ramps
///   - excludeClosures: Whether to exclude roads considered closed due to live traffic closure
///   - minRoadClass: Lowest road class allowed
///   - maxRoadClass: Highest road class allowed
public struct SearchFilter: Codable, Sendable {
    
    let excludeTunnel: Bool
    let excludeBridge: Bool
    let excludeToll: Bool
    let excludeFerry: Bool
    let excludeRamp: Bool
    let excludeClosures: Bool
    let minRoadClass: RoadClass
    let maxRoadClass: RoadClass
    
    /// Initializer with all default values
    /// - Parameters:
    ///   - excludeTunnel: Whether to exclude roads marked as tunnels
    ///   - excludeBridge: Whether to exclude roads marked as bridges
    ///   - excludeToll: Whether to exclude toll
    ///   - excludeFerry: Whether to exclude ferry
    ///   - excludeRamp: Whether to exclude link roads marked as ramps, note that some turn channels are also marked as ramps
    ///   - excludeClosures: Whether to exclude roads considered closed due to live traffic closure
    ///   - minRoadClass: Lowest road class allowed
    ///   - maxRoadClass: Highest road class allowed
    init(
        excludeTunnel: Bool = false,
        excludeBridge: Bool = false,
        excludeToll: Bool = false,
        excludeFerry: Bool = false,
        excludeRamp: Bool = false,
        excludeClosures: Bool = true,
        minRoadClass: RoadClass = .serviceOther,
        maxRoadClass: RoadClass = .motorway
    ) {
        self.excludeTunnel = excludeTunnel
        self.excludeBridge = excludeBridge
        self.excludeToll = excludeToll
        self.excludeFerry = excludeFerry
        self.excludeRamp = excludeRamp
        self.excludeClosures = excludeClosures
        self.minRoadClass = minRoadClass
        self.maxRoadClass = maxRoadClass
    }
    
    enum CodingKeys: String, CodingKey {
        case excludeTunnel = "exclude_tunnel"
        case excludeBridge = "exclude_bridge"
        case excludeToll = "exclude_toll"
        case excludeFerry = "exclude_ferry"
        case excludeRamp = "exclude_ramp"
        case excludeClosures = "exclude_closures"
        case minRoadClass = "min_road_class"
        case maxRoadClass = "max_road_class"
    }
    
}
