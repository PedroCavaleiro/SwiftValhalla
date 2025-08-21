//
//  Filter.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents all available filter keys that can be applied when working with
/// Valhalla routing and map-matching data.
///
/// Each case corresponds to a specific field in the Valhalla API, grouped by
/// category (`edge`, `node`, `admin`, `matched`, etc.).
/// The raw value matches the exact key string expected by Valhalla.
///
/// Conformance to `Codable` makes it easy to serialize and deserialize filters,
/// and `CaseIterable` allows iteration over all supported filters.
public enum Filter: String, Codable, CaseIterable {
    /// List of names
    case edgeNames = "edge.names"
    /// The matched edge length in the units specified (default is kilometers). If `source_percent_along` and/or `target_percent_along are present, this represents the partially matched edge length, otherwise the full edge length.
    case edgeLength = "edge.length"
    /// Edge speed in the units specified. The default is kilometers per hour.
    case edgeSpeed = "edge.speed"
    /// Contains all flow speeds available for that edge in the units specified (default is kilometers per hour)
    /// - Note: These speeds are faded with the current flow (if available). The `current_flow` fades with the `flow_mask` that was passed to the request.
    case edgeSpeedsFaded = "edge.speeds_faded"
    /// Contains all raw flow speeds available for that edge in the units specified (default is kilometers per hour).
    case edgeSpeedsNonFaded = "edge.speeds_non_faded"
    /// Road class values
    case edgeRoadClass = "edge.road_class"
    /// The direction at the beginning of an edge. The units are degrees from north in a clockwise direction.
    case edgeBeginHeading = "edge.begin_heading"
    /// The direction at the end of an edge. The units are degrees from north in a clockwise direction.
    case edgeEndHeading = "edge.end_heading"
    /// Index into the list of shape points for the start of the edge.
    case edgeBeginShapeIndex = "edge.begin_shape_index"
    /// Index into the list of shape points for the end of the edge.
    case edgeEndShapeIndex = "edge.end_shape_index"
    /// Traversability values, if available
    case edgeTraversability = "edge.traversability"
    /// Use values
    case edgeUse = "edge.use"
    /// If the edge has any toll.
    case edgeToll = "edge.toll"
    /// If the edge is unpaved or rough pavement.
    case edgeUnpaved = "edge.unpaved"
    /// If the edge is a tunnel.
    case edgeTunnel = "edge.tunnel"
    /// If the edge is a bridge.
    case edgeBridge = "edge.bridge"
    /// If the edge is a roundabout.
    case edgeRoundabout = "edge.roundabout"
    /// If the edge is an internal intersection.
    case edgeInternalIntersection = "edge.internal_intersection"
    /// If the flag is enabled for driving on the right side of the street.
    case edgeDriveOnRight = "edge.drive_on_right"
    /// Surface values
    case edgeSurface = "edge.surface"
    /// List of exit number elements. If an exit number element exists, it is typically just one value. Element example: `91B
    case edgeSignExitNumber = "edge.sign.exit_number"
    /// List of exit branch elements. An exit branch element is the subsequent road name or route number after the sign. Element example: `I 95 North`
    case edgeSignExitBranch = "edge.sign.exit_branch"
    /// List of exit toward elements. The exit toward element is the location where the road ahead goes; the location is typically a control city, but may also be a future road name or route number. Element example: `New York
    case edgeSignExitToward = "edge.sign.exit_toward"
    /// List of exit name elements. The exit name element is the interchange identifier, although typically not used in the United States. Element example: `Gettysburg Pike`
    case edgeSignExitName = "edge.sign.exit_name"
    /// Travel mode values
    case edgeTravelMode = "edge.travel_mode"
    /// Vehicle type values
    case edgeVehicleType = "edge.vehicle_type"
    /// Pedestrian type values
    case edgePedestrianType = "edge.pedestrian_type"
    /// Bicycle type values
    case edgeBicycleType = "edge.bicycle_type"
    /// Transit type values
    case edgeTransitType = "edge.transit_type"
    /// Identifier of an edge within the tiled, hierarchical graph.
    case edgeId = "edge.id"
    /// Whether or not the edge is inside of a building or structure or not.
    case edgeIndoor = "edge.indoor"
    /// Way identifier of the OpenStreetMap base data.
    case edgeWayId = "edge.way_id"
    /// The weighted grade factor. Valhalla manufactures a `weighted_grade from elevation data. It is a measure used for hill avoidance in routing - sort of a relative energy use along an edge. But since an edge in Valhalla can possibly go up and down over several hills it might not equate to what most folks think of as grade.
    case edgeWeightedGrade = "edge.weighted_grade"
    /// The maximum upward slope. A value of 32768 indicates no elevation data is available for this edge.
    case edgeMaxUpwardGrade = "edge.max_upward_grade"
    /// The maximum downward slope. A value of 32768 indicates no elevation data is available for this edge.
    case edgeMaxDownwardGrade = "edge.max_downward_grade"
    /// The mean or average elevation along the edge. Units are meters by default. If the units are specified as miles, then the mean elevation is returned in feet. A value of 32768 indicates no elevation data is available for this edge.
    case edgeMeanElevation = "edge.mean_elevation"
    /// The number of lanes for this edge.
    case edgeLaneCount = "edge.lane_count"
    /// The type (if any) of bicycle lane along this edge.
    case edgeCycleLane = "edge.cycle_lane"
    /// The bike network for this edge.
    case edgeBicycleNetwork = "edge.bicycle_network"
    /// Classification of hiking trails based on difficulty.
    case edgeSacScale = "edge.sac_scale"
    /// If the edge has a shoulder.
    case edgeShoulder = "edge.shoulder"
    /// Sidewalk values
    case edgeSidewalk = "edge.sidewalk"
    /// The relative density along the edge.
    case edgeDensity = "edge.density"
    /// Edge speed limit in the units specified. The default is kilometers per hour.
    case edgeSpeedLimit = "edge.speed_limit"
    /// Edge truck speed in the units specified. The default is kilometers per hour.
    case edgeTruckSpeed = "edge.truck_speed"
    /// If edge is part of a truck network/route.
    case edgeTruckRoute = "edge.truck_route"
    /// If the edge is a country crossing.
    case edgeCountryCrossing = "edge.country_crossing"
    /// True if the edge is traversed forwards and False if it is traversed backwards with respect to the reference shape/geometry (ie. the direction in which it was digitized).
    case edgeForward = "edge.forward"
    /// If the edge contains a traffic signal in its direction.
    case edgeTrafficSignal = "edge.traffic_signal"
    
    /// The direction at the beginning of this intersecting edge. The units are degrees from north in a clockwise direction.
    case nodeIntersectingEdgeBeginHeading = "node.intersecting_edge.begin_heading"
    /// If this intersecting edge at the end node has consistent names with the path `from edge.
    case nodeIntersectingEdgeFromEdgeNameConsistency = "node.intersecting_edge.from_edge_name_consistency"
    /// If this intersecting edge at the end node has consistent names with the path `to edge`.
    case nodeIntersectingEdgeToEdgeNameConsistency = "node.intersecting_edge.to_edge_name_consistency"
    /// Driveability values, if available
    case nodeIntersectingEdgeDriveability = "node.intersecting_edge.driveability"
    /// Cyclability values, if available
    case nodeIntersectingEdgeCyclability = "node.intersecting_edge.cyclability"
    /// Walkability values, if available
    case nodeIntersectingEdgeWalkability = "node.intersecting_edge.walkability"
    /// Use values
    case nodeIntersectingEdgeUse = "node.intersecting_edge.use"
    /// Road class values
    case nodeIntersectingEdgeRoadClass = "node.intersecting_edge.road_class"
    /// The number of lanes for this edge.
    case nodeIntersectingEdgeLaneCount = "node.intersecting_edge.lane_count"
    /// Elapsed time of the path to arrive at this node.
    case nodeElapsedTime = "node.elapsed_time"
    /// Index value in the admin list.
    case nodeAdminIndex = "node.admin_index"
    /// Node type values
    case nodeType = "node.type"
    /// A boolean value indicating whether the node is a traffic signal (`true` or `false)
    case nodeTrafficSignal = "node.traffic_signal"
    /// If this node is a fork.
    case nodeFork = "node.fork"
    /// Time zone string for this node.
    case nodeTimeZone = "node.time_zone"
    
    case osmChangeset = "osm_changeset"
    /// The encoded polyline of the matched path.
    case shape = "shape"
    
    /// Country ISO 3166-1 alpha-2 code.
    case adminCountryCode = "admin.country_code"
    /// Country name.
    case adminCountryText = "admin.country_text"
    /// State code.
    case adminStateCode = "admin.state_code"
    /// State name.
    case adminStateText = "admin.state_text"
    
    /// List of match results when using the `map_snap` shape match algorithm. There is a one-to-one correspondence with the input set of `latitude`, `longitude coordinates and this list of match results.
    case matchedPoint = "matched.point"
    /// Describes the type of this match result - possible values include:
    case matchedType = "matched.type"
    /// The index of the edge in the list of edges that this matched point is associated with. This value will not exist if this point was unmatched.
    case matchedEdgeIndex = "matched.edge_index"
    /// The boolean value is true if this match result is the begin location of a route disconnect. This value will not exist if this is false.
    case matchedBeginRouteDiscontinuity = "matched.begin_route_discontinuity"
    /// The boolean value is true if this match result is the end location of a route disconnect. This value will not exist if this is false.
    case matchedEndRouteDiscontinuity = "matched.end_route_discontinuity"
    /// The distance along the associated edge for this matched point. For example, if the matched point is halfway along the edge then the value would be 0.5. This value will not exist if this point was unmatched.
    case matchedDistanceAlongEdge = "matched.distance_along_edge"
    /// The distance in meters from the trace point to the matched point. This value will not exist if this point was unmatched.
    case matchedDistanceFromTracePoint = "matched.distance_from_trace_point"
}
