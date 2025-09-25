//
//  CostingOptions.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation

/// Configuration options for route costing and avoidance preferences.
///
/// Use `CostingOptions` to specify routing preferences such as avoiding tolls, highways, or ferries,
/// and to control various routing parameters including vehicle specifications, road preferences,
/// and cost factors.
///
/// ## Usage
///
/// ```swift
/// let options = CostingOptions(
///     avoidTolls: true,
///     avoidHighways: false,
///     shortcut: true,
///     maneuverPenalty: 5.0,
///     countryChangingPenalty: 600.0
/// )
/// ```
///
/// All properties are optional, allowing you to specify only the preferences you need.
/// Different costing models support different subsets of these options.
public struct CostingOptions: Codable, @unchecked Sendable {
    
    // MARK: - Avoidance Options
    
    /// Whether to avoid toll roads in route calculation.
    ///
    /// When set to `true`, the routing algorithm will attempt to find routes that avoid toll roads.
    /// When `nil`, the default routing behavior applies.
    public let avoidTolls: Bool?
    
    /// Whether to avoid highways and major roads in route calculation.
    ///
    /// When set to `true`, the routing algorithm will prefer local roads over highways.
    /// When `nil`, the default routing behavior applies.
    public let avoidHighways: Bool?
    
    /// Whether to avoid ferry routes in route calculation.
    ///
    /// When set to `true`, the routing algorithm will attempt to find routes that avoid ferries.
    /// When `nil`, the default routing behavior applies.
    public let avoidFerries: Bool?
    
    /// Whether to prioritize the shortest possible route.
    ///
    /// When set to `true`, the routing algorithm will prioritize distance over travel time.
    /// When set to `false`, the algorithm may prefer faster routes even if they are longer.
    /// When `nil`, the default routing behavior applies.
    public let shortcut: Bool?
    
    // MARK: - Maneuver and Turn Options
    
    /// A penalty (in seconds) applied when transitioning between roads that do not have consistent naming.
    ///
    /// This penalty helps create simpler routes by avoiding turns onto roads with different names.
    /// Default values vary by costing model.
    public let maneuverPenalty: Double?
    
    /// A penalty applied to gate access.
    ///
    /// This penalty is applied when a gate must be opened to continue along the route.
    public let gateCost: Double?
    
    /// A penalty applied when a gate has access restrictions based on private use or time-based restrictions.
    ///
    /// This penalty is separate from the basic gate cost and accounts for additional access complexity.
    public let gateAccessCost: Double?
    
    /// A penalty applied to toll booth access.
    ///
    /// This penalty is applied when crossing toll booths, separate from avoiding tolls entirely.
    public let tollBoothCost: Double?
    
    /// A penalty applied when a toll booth has access restrictions based on private use or time-based restrictions.
    ///
    /// This penalty accounts for additional complexity when accessing restricted toll facilities.
    public let tollBoothAccessCost: Double?
    
    /// A penalty applied to country border crossings.
    ///
    /// This penalty is applied when the route crosses from one country to another.
    /// Can be used to minimize border crossings in international routing.
    public let countryChangingPenalty: Double?
    
    // MARK: - Vehicle Specifications (Auto/Truck)
    
    /// Vehicle length in meters.
    ///
    /// Used for truck routing to determine road restrictions. Roads with length restrictions
    /// less than this value will be avoided or penalized.
    public let length: Double?
    
    /// Vehicle width in meters.
    ///
    /// Used for truck routing to determine road restrictions. Roads with width restrictions
    /// less than this value will be avoided or penalized.
    public let width: Double?
    
    /// Vehicle height in meters.
    ///
    /// Used for truck routing to determine road restrictions. Roads with height restrictions
    /// (such as low bridges) less than this value will be avoided or penalized.
    public let height: Double?
    
    /// Vehicle weight in metric tons.
    ///
    /// Used for truck routing to determine road restrictions. Roads with weight restrictions
    /// less than this value will be avoided or penalized.
    public let weight: Double?
    
    /// Vehicle axle load in metric tons.
    ///
    /// Used for truck routing to determine axle load restrictions on roads and bridges.
    public let axleLoad: Double?
    
    /// Number of axles on the vehicle.
    ///
    /// Used for truck routing where axle count restrictions apply.
    public let axleCount: Int?
    
    /// Whether the vehicle is carrying hazardous materials.
    ///
    /// When `true`, roads that prohibit hazardous materials will be avoided.
    /// Used primarily for truck routing.
    public let hazmat: Bool?
    
    // MARK: - Road Type Preferences
    
    /// A factor that modifies the cost when traveling on motorways/highways.
    ///
    /// Values greater than 1.0 make motorways less preferred, while values less than 1.0
    /// make them more preferred. Default is typically 1.0 (neutral).
    public let motorwayFactor: Double?
    
    /// A factor that modifies the cost when traveling on trunk roads.
    ///
    /// Values greater than 1.0 make trunk roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let trunkFactor: Double?
    
    /// A factor that modifies the cost when traveling on primary roads.
    ///
    /// Values greater than 1.0 make primary roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let primaryFactor: Double?
    
    /// A factor that modifies the cost when traveling on secondary roads.
    ///
    /// Values greater than 1.0 make secondary roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let secondaryFactor: Double?
    
    /// A factor that modifies the cost when traveling on tertiary roads.
    ///
    /// Values greater than 1.0 make tertiary roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let tertiaryFactor: Double?
    
    /// A factor that modifies the cost when traveling on unclassified roads.
    ///
    /// Values greater than 1.0 make unclassified roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let unclassifiedFactor: Double?
    
    /// A factor that modifies the cost when traveling on residential roads.
    ///
    /// Values greater than 1.0 make residential roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let residentialFactor: Double?
    
    /// A factor that modifies the cost when traveling on service roads.
    ///
    /// Values greater than 1.0 make service roads less preferred, while values less than 1.0
    /// make them more preferred.
    public let serviceRoadFactor: Double?
    
    // MARK: - Speed and Time Factors
    
    /// Maximum speed for the route in kilometers per hour.
    ///
    /// This sets an upper limit on the speed used for time calculations, regardless of
    /// posted speed limits or default speeds.
    public let topSpeed: Double?
    
    /// A factor applied to edge speeds.
    ///
    /// Values greater than 1.0 increase effective speeds (making routes faster),
    /// while values less than 1.0 decrease effective speeds.
    public let speedFactor: Double?
    
    /// A penalty applied for making U-turns.
    ///
    /// This penalty discourages routes that require U-turn maneuvers.
    public let uturnPenalty: Double?
    
    /// Whether to use traffic information when available.
    ///
    /// When `true` and traffic data is available, routing will consider current traffic conditions.
    /// When `false` or `nil`, routing uses free-flow speeds.
    public let useTraffic: Bool?
    
    // MARK: - Walking/Pedestrian Options
    
    /// Maximum walking speed in kilometers per hour.
    ///
    /// Used for pedestrian routing to calculate travel times.
    public let walkingSpeed: Double?
    
    /// A factor that influences walkway preferences.
    ///
    /// Values greater than 1.0 make walkways less preferred, while values less than 1.0
    /// make them more preferred.
    public let walkwayFactor: Double?
    
    /// A factor that influences sidewalk preferences.
    ///
    /// Values greater than 1.0 make sidewalks less preferred, while values less than 1.0
    /// make them more preferred.
    public let sidewalkFactor: Double?
    
    /// A factor that influences alley preferences.
    ///
    /// Values greater than 1.0 make alleys less preferred, while values less than 1.0
    /// make them more preferred.
    public let alleyFactor: Double?
    
    /// A factor that influences driveway preferences.
    ///
    /// Values greater than 1.0 make driveways less preferred, while values less than 1.0
    /// make them more preferred.
    public let drivewayFactor: Double?
    
    /// A penalty for crossing intersections.
    ///
    /// This penalty is applied when the pedestrian route crosses through intersections.
    public let crossingPenalty: Double?
    
    /// Maximum grade (slope) that is preferred for walking routes.
    ///
    /// Steeper grades will be penalized to find more comfortable walking routes.
    /// Expressed as a percentage (e.g., 8.0 for 8% grade).
    public let maxGrade: Double?
    
    // MARK: - Bicycle Options
    
    /// Maximum cycling speed in kilometers per hour.
    ///
    /// Used for bicycle routing to calculate travel times.
    public let cyclingSpeed: Double?
    
    /// A factor that influences bicycle lane preferences.
    ///
    /// Values greater than 1.0 make bicycle lanes less preferred, while values less than 1.0
    /// make them more preferred.
    public let bicycleLaneFactor: Double?
    
    /// A factor that influences cycleway preferences.
    ///
    /// Values greater than 1.0 make cycleways less preferred, while values less than 1.0
    /// make them more preferred.
    public let cyclewayFactor: Double?
    
    /// A factor that influences mountain bike trail preferences.
    ///
    /// Values greater than 1.0 make mountain bike trails less preferred, while values less than 1.0
    /// make them more preferred.
    public let mountainBikeFactor: Double?
    
    /// Whether to avoid roads with poor surfaces for cycling.
    ///
    /// When `true`, routes will prefer paved roads over unpaved surfaces.
    public let avoidBadSurfaces: Bool?
    
    // MARK: - Transit Options
    
    /// Preferred mode filters for transit routing.
    ///
    /// This can be used to prefer or avoid specific types of transit (bus, rail, etc.).
    /// The specific format depends on the transit implementation.
    public let transitModeFilters: [String: Any]?
    
    /// Walking distance to transit stops in meters.
    ///
    /// Maximum distance willing to walk to reach transit stops.
    public let transitWalkingDistance: Double?
    
    /// Creates a new costing options configuration.
    ///
    /// - Parameters:
    ///   - avoidTolls: Whether to avoid toll roads. Defaults to `nil`.
    ///   - avoidHighways: Whether to avoid highways and major roads. Defaults to `nil`.
    ///   - avoidFerries: Whether to avoid ferry routes. Defaults to `nil`.
    ///   - shortcut: Whether to prioritize the shortest route. Defaults to `nil`.
    ///   - maneuverPenalty: Penalty for turns between roads with inconsistent naming. Defaults to `nil`.
    ///   - gateCost: Penalty for gate access. Defaults to `nil`.
    ///   - gateAccessCost: Penalty for restricted gate access. Defaults to `nil`.
    ///   - tollBoothCost: Penalty for toll booth access. Defaults to `nil`.
    ///   - tollBoothAccessCost: Penalty for restricted toll booth access. Defaults to `nil`.
    ///   - countryChangingPenalty: Penalty for country border crossings. Defaults to `nil`.
    ///   - length: Vehicle length in meters. Defaults to `nil`.
    ///   - width: Vehicle width in meters. Defaults to `nil`.
    ///   - height: Vehicle height in meters. Defaults to `nil`.
    ///   - weight: Vehicle weight in metric tons. Defaults to `nil`.
    ///   - axleLoad: Vehicle axle load in metric tons. Defaults to `nil`.
    ///   - axleCount: Number of vehicle axles. Defaults to `nil`.
    ///   - hazmat: Whether vehicle carries hazardous materials. Defaults to `nil`.
    ///   - motorwayFactor: Cost factor for motorways. Defaults to `nil`.
    ///   - trunkFactor: Cost factor for trunk roads. Defaults to `nil`.
    ///   - primaryFactor: Cost factor for primary roads. Defaults to `nil`.
    ///   - secondaryFactor: Cost factor for secondary roads. Defaults to `nil`.
    ///   - tertiaryFactor: Cost factor for tertiary roads. Defaults to `nil`.
    ///   - unclassifiedFactor: Cost factor for unclassified roads. Defaults to `nil`.
    ///   - residentialFactor: Cost factor for residential roads. Defaults to `nil`.
    ///   - serviceRoadFactor: Cost factor for service roads. Defaults to `nil`.
    ///   - topSpeed: Maximum speed in km/h. Defaults to `nil`.
    ///   - speedFactor: Speed adjustment factor. Defaults to `nil`.
    ///   - uturnPenalty: Penalty for U-turns. Defaults to `nil`.
    ///   - useTraffic: Whether to use traffic information. Defaults to `nil`.
    ///   - walkingSpeed: Maximum walking speed in km/h. Defaults to `nil`.
    ///   - walkwayFactor: Cost factor for walkways. Defaults to `nil`.
    ///   - sidewalkFactor: Cost factor for sidewalks. Defaults to `nil`.
    ///   - alleyFactor: Cost factor for alleys. Defaults to `nil`.
    ///   - drivewayFactor: Cost factor for driveways. Defaults to `nil`.
    ///   - crossingPenalty: Penalty for intersection crossings. Defaults to `nil`.
    ///   - maxGrade: Maximum preferred grade percentage. Defaults to `nil`.
    ///   - cyclingSpeed: Maximum cycling speed in km/h. Defaults to `nil`.
    ///   - bicycleLaneFactor: Cost factor for bicycle lanes. Defaults to `nil`.
    ///   - cyclewayFactor: Cost factor for cycleways. Defaults to `nil`.
    ///   - mountainBikeFactor: Cost factor for mountain bike trails. Defaults to `nil`.
    ///   - avoidBadSurfaces: Whether to avoid poor surfaces for cycling. Defaults to `nil`.
    ///   - transitModeFilters: Preferred transit modes. Defaults to `nil`.
    ///   - transitWalkingDistance: Walking distance to transit in meters. Defaults to `nil`.
    public init(
        avoidTolls: Bool? = nil,
        avoidHighways: Bool? = nil,
        avoidFerries: Bool? = nil,
        shortcut: Bool? = nil,
        maneuverPenalty: Double? = nil,
        gateCost: Double? = nil,
        gateAccessCost: Double? = nil,
        tollBoothCost: Double? = nil,
        tollBoothAccessCost: Double? = nil,
        countryChangingPenalty: Double? = nil,
        length: Double? = nil,
        width: Double? = nil,
        height: Double? = nil,
        weight: Double? = nil,
        axleLoad: Double? = nil,
        axleCount: Int? = nil,
        hazmat: Bool? = nil,
        motorwayFactor: Double? = nil,
        trunkFactor: Double? = nil,
        primaryFactor: Double? = nil,
        secondaryFactor: Double? = nil,
        tertiaryFactor: Double? = nil,
        unclassifiedFactor: Double? = nil,
        residentialFactor: Double? = nil,
        serviceRoadFactor: Double? = nil,
        topSpeed: Double? = nil,
        speedFactor: Double? = nil,
        uturnPenalty: Double? = nil,
        useTraffic: Bool? = nil,
        walkingSpeed: Double? = nil,
        walkwayFactor: Double? = nil,
        sidewalkFactor: Double? = nil,
        alleyFactor: Double? = nil,
        drivewayFactor: Double? = nil,
        crossingPenalty: Double? = nil,
        maxGrade: Double? = nil,
        cyclingSpeed: Double? = nil,
        bicycleLaneFactor: Double? = nil,
        cyclewayFactor: Double? = nil,
        mountainBikeFactor: Double? = nil,
        avoidBadSurfaces: Bool? = nil,
        transitModeFilters: [String: Any]? = nil,
        transitWalkingDistance: Double? = nil
    ) {
        self.avoidTolls = avoidTolls
        self.avoidHighways = avoidHighways
        self.avoidFerries = avoidFerries
        self.shortcut = shortcut
        self.maneuverPenalty = maneuverPenalty
        self.gateCost = gateCost
        self.gateAccessCost = gateAccessCost
        self.tollBoothCost = tollBoothCost
        self.tollBoothAccessCost = tollBoothAccessCost
        self.countryChangingPenalty = countryChangingPenalty
        self.length = length
        self.width = width
        self.height = height
        self.weight = weight
        self.axleLoad = axleLoad
        self.axleCount = axleCount
        self.hazmat = hazmat
        self.motorwayFactor = motorwayFactor
        self.trunkFactor = trunkFactor
        self.primaryFactor = primaryFactor
        self.secondaryFactor = secondaryFactor
        self.tertiaryFactor = tertiaryFactor
        self.unclassifiedFactor = unclassifiedFactor
        self.residentialFactor = residentialFactor
        self.serviceRoadFactor = serviceRoadFactor
        self.topSpeed = topSpeed
        self.speedFactor = speedFactor
        self.uturnPenalty = uturnPenalty
        self.useTraffic = useTraffic
        self.walkingSpeed = walkingSpeed
        self.walkwayFactor = walkwayFactor
        self.sidewalkFactor = sidewalkFactor
        self.alleyFactor = alleyFactor
        self.drivewayFactor = drivewayFactor
        self.crossingPenalty = crossingPenalty
        self.maxGrade = maxGrade
        self.cyclingSpeed = cyclingSpeed
        self.bicycleLaneFactor = bicycleLaneFactor
        self.cyclewayFactor = cyclewayFactor
        self.mountainBikeFactor = mountainBikeFactor
        self.avoidBadSurfaces = avoidBadSurfaces
        self.transitModeFilters = transitModeFilters
        self.transitWalkingDistance = transitWalkingDistance
    }
    
    /// Coding keys for JSON serialization.
    ///
    /// Maps Swift property names to their corresponding JSON keys used in the Valhalla API.
    enum CodingKeys: String, CodingKey {
        case avoidTolls = "avoid_tolls"
        case avoidHighways = "avoid_highways"
        case avoidFerries = "avoid_ferries"
        case shortcut = "shortest"
        case maneuverPenalty = "maneuver_penalty"
        case gateCost = "gate_cost"
        case gateAccessCost = "gate_access_cost"
        case tollBoothCost = "toll_booth_cost"
        case tollBoothAccessCost = "toll_booth_access_cost"
        case countryChangingPenalty = "country_changing_penalty"
        case length = "length"
        case width = "width"
        case height = "height"
        case weight = "weight"
        case axleLoad = "axle_load"
        case axleCount = "axle_count"
        case hazmat = "hazmat"
        case motorwayFactor = "motorway_factor"
        case trunkFactor = "trunk_factor"
        case primaryFactor = "primary_factor"
        case secondaryFactor = "secondary_factor"
        case tertiaryFactor = "tertiary_factor"
        case unclassifiedFactor = "unclassified_factor"
        case residentialFactor = "residential_factor"
        case serviceRoadFactor = "service_road_factor"
        case topSpeed = "top_speed"
        case speedFactor = "speed_factor"
        case uturnPenalty = "uturn_penalty"
        case useTraffic = "use_traffic"
        case walkingSpeed = "walking_speed"
        case walkwayFactor = "walkway_factor"
        case sidewalkFactor = "sidewalk_factor"
        case alleyFactor = "alley_factor"
        case drivewayFactor = "driveway_factor"
        case crossingPenalty = "crossing_penalty"
        case maxGrade = "max_grade"
        case cyclingSpeed = "cycling_speed"
        case bicycleLaneFactor = "bicycle_lane_factor"
        case cyclewayFactor = "cycleway_factor"
        case mountainBikeFactor = "mountain_bike_factor"
        case avoidBadSurfaces = "avoid_bad_surfaces"
        case transitModeFilters = "transit_mode_filters"
        case transitWalkingDistance = "transit_walking_distance"
    }
    
    // Custom coding implementation to handle the transitModeFilters which contains Any
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(avoidTolls, forKey: .avoidTolls)
        try container.encodeIfPresent(avoidHighways, forKey: .avoidHighways)
        try container.encodeIfPresent(avoidFerries, forKey: .avoidFerries)
        try container.encodeIfPresent(shortcut, forKey: .shortcut)
        try container.encodeIfPresent(maneuverPenalty, forKey: .maneuverPenalty)
        try container.encodeIfPresent(gateCost, forKey: .gateCost)
        try container.encodeIfPresent(gateAccessCost, forKey: .gateAccessCost)
        try container.encodeIfPresent(tollBoothCost, forKey: .tollBoothCost)
        try container.encodeIfPresent(tollBoothAccessCost, forKey: .tollBoothAccessCost)
        try container.encodeIfPresent(countryChangingPenalty, forKey: .countryChangingPenalty)
        try container.encodeIfPresent(length, forKey: .length)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(weight, forKey: .weight)
        try container.encodeIfPresent(axleLoad, forKey: .axleLoad)
        try container.encodeIfPresent(axleCount, forKey: .axleCount)
        try container.encodeIfPresent(hazmat, forKey: .hazmat)
        try container.encodeIfPresent(motorwayFactor, forKey: .motorwayFactor)
        try container.encodeIfPresent(trunkFactor, forKey: .trunkFactor)
        try container.encodeIfPresent(primaryFactor, forKey: .primaryFactor)
        try container.encodeIfPresent(secondaryFactor, forKey: .secondaryFactor)
        try container.encodeIfPresent(tertiaryFactor, forKey: .tertiaryFactor)
        try container.encodeIfPresent(unclassifiedFactor, forKey: .unclassifiedFactor)
        try container.encodeIfPresent(residentialFactor, forKey: .residentialFactor)
        try container.encodeIfPresent(serviceRoadFactor, forKey: .serviceRoadFactor)
        try container.encodeIfPresent(topSpeed, forKey: .topSpeed)
        try container.encodeIfPresent(speedFactor, forKey: .speedFactor)
        try container.encodeIfPresent(uturnPenalty, forKey: .uturnPenalty)
        try container.encodeIfPresent(useTraffic, forKey: .useTraffic)
        try container.encodeIfPresent(walkingSpeed, forKey: .walkingSpeed)
        try container.encodeIfPresent(walkwayFactor, forKey: .walkwayFactor)
        try container.encodeIfPresent(sidewalkFactor, forKey: .sidewalkFactor)
        try container.encodeIfPresent(alleyFactor, forKey: .alleyFactor)
        try container.encodeIfPresent(drivewayFactor, forKey: .drivewayFactor)
        try container.encodeIfPresent(crossingPenalty, forKey: .crossingPenalty)
        try container.encodeIfPresent(maxGrade, forKey: .maxGrade)
        try container.encodeIfPresent(cyclingSpeed, forKey: .cyclingSpeed)
        try container.encodeIfPresent(bicycleLaneFactor, forKey: .bicycleLaneFactor)
        try container.encodeIfPresent(cyclewayFactor, forKey: .cyclewayFactor)
        try container.encodeIfPresent(mountainBikeFactor, forKey: .mountainBikeFactor)
        try container.encodeIfPresent(avoidBadSurfaces, forKey: .avoidBadSurfaces)
        try container.encodeIfPresent(transitWalkingDistance, forKey: .transitWalkingDistance)
        if let filters = transitModeFilters {
            try container.encode(AnyCodable(filters), forKey: .transitModeFilters)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        avoidTolls = try container.decodeIfPresent(Bool.self, forKey: .avoidTolls)
        avoidHighways = try container.decodeIfPresent(Bool.self, forKey: .avoidHighways)
        avoidFerries = try container.decodeIfPresent(Bool.self, forKey: .avoidFerries)
        shortcut = try container.decodeIfPresent(Bool.self, forKey: .shortcut)
        maneuverPenalty = try container.decodeIfPresent(Double.self, forKey: .maneuverPenalty)
        gateCost = try container.decodeIfPresent(Double.self, forKey: .gateCost)
        gateAccessCost = try container.decodeIfPresent(Double.self, forKey: .gateAccessCost)
        tollBoothCost = try container.decodeIfPresent(Double.self, forKey: .tollBoothCost)
        tollBoothAccessCost = try container.decodeIfPresent(Double.self, forKey: .tollBoothAccessCost)
        countryChangingPenalty = try container.decodeIfPresent(Double.self, forKey: .countryChangingPenalty)
        length = try container.decodeIfPresent(Double.self, forKey: .length)
        width = try container.decodeIfPresent(Double.self, forKey: .width)
        height = try container.decodeIfPresent(Double.self, forKey: .height)
        weight = try container.decodeIfPresent(Double.self, forKey: .weight)
        axleLoad = try container.decodeIfPresent(Double.self, forKey: .axleLoad)
        axleCount = try container.decodeIfPresent(Int.self, forKey: .axleCount)
        hazmat = try container.decodeIfPresent(Bool.self, forKey: .hazmat)
        motorwayFactor = try container.decodeIfPresent(Double.self, forKey: .motorwayFactor)
        trunkFactor = try container.decodeIfPresent(Double.self, forKey: .trunkFactor)
        primaryFactor = try container.decodeIfPresent(Double.self, forKey: .primaryFactor)
        secondaryFactor = try container.decodeIfPresent(Double.self, forKey: .secondaryFactor)
        tertiaryFactor = try container.decodeIfPresent(Double.self, forKey: .tertiaryFactor)
        unclassifiedFactor = try container.decodeIfPresent(Double.self, forKey: .unclassifiedFactor)
        residentialFactor = try container.decodeIfPresent(Double.self, forKey: .residentialFactor)
        serviceRoadFactor = try container.decodeIfPresent(Double.self, forKey: .serviceRoadFactor)
        topSpeed = try container.decodeIfPresent(Double.self, forKey: .topSpeed)
        speedFactor = try container.decodeIfPresent(Double.self, forKey: .speedFactor)
        uturnPenalty = try container.decodeIfPresent(Double.self, forKey: .uturnPenalty)
        useTraffic = try container.decodeIfPresent(Bool.self, forKey: .useTraffic)
        walkingSpeed = try container.decodeIfPresent(Double.self, forKey: .walkingSpeed)
        walkwayFactor = try container.decodeIfPresent(Double.self, forKey: .walkwayFactor)
        sidewalkFactor = try container.decodeIfPresent(Double.self, forKey: .sidewalkFactor)
        alleyFactor = try container.decodeIfPresent(Double.self, forKey: .alleyFactor)
        drivewayFactor = try container.decodeIfPresent(Double.self, forKey: .drivewayFactor)
        crossingPenalty = try container.decodeIfPresent(Double.self, forKey: .crossingPenalty)
        maxGrade = try container.decodeIfPresent(Double.self, forKey: .maxGrade)
        cyclingSpeed = try container.decodeIfPresent(Double.self, forKey: .cyclingSpeed)
        bicycleLaneFactor = try container.decodeIfPresent(Double.self, forKey: .bicycleLaneFactor)
        cyclewayFactor = try container.decodeIfPresent(Double.self, forKey: .cyclewayFactor)
        mountainBikeFactor = try container.decodeIfPresent(Double.self, forKey: .mountainBikeFactor)
        avoidBadSurfaces = try container.decodeIfPresent(Bool.self, forKey: .avoidBadSurfaces)
        transitWalkingDistance = try container.decodeIfPresent(Double.self, forKey: .transitWalkingDistance)
        
        if let dict = try container.decodeIfPresent([String: AnyCodable].self, forKey: .transitModeFilters) {
            transitModeFilters = dict.mapValues { $0.value }
        } else {
            transitModeFilters = nil
        }
    }
}

