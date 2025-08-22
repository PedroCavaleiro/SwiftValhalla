//
//  Shape.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// This structure represents the shape to be sent to the MapMatching service
/// - Parameters:
///   - latitude: The latitude
///   - longitude: The longitude
///   - timestamp: A timestamp, this will improve the result
///   - traceType: Type of location, either break, through, via or `breakThrough`
///   - heading: Preferred direction of travel for the start from the location. This can be useful for mobile routing where a vehicle is traveling in a specific direction along a road, and the route should start in that direction. The heading is indicated in degrees from north in a clockwise direction, where north is 0°, east is 90°, south is 180°, and west is 270°.
///   - headingTolerance: How close in degrees a given street's angle must be in order for it to be considered as in the same direction of the `heading` parameter.
///   - street: Street name. The street name may be used to assist finding the correct routing location at the specified latitude, longitude. This is not currently implemented.
///   - wayId: OpenStreetMap identification number for a polyline way. The way ID may be used to assist finding the correct routing location at the specified latitude, longitude. This is not currently implemented.
///   - minimumReachability: Minimum number of nodes (intersections) reachable for a given edge (road between intersections) to consider that edge as belonging to a connected region. When correlating this location to the route network, try to find candidates who are reachable from this many or more nodes (intersections). If a given candidate edge reaches less than this number of nodes its considered to be a disconnected island and we'll search for more candidates until we find at least one that isn't considered a disconnected island. If this value is larger than the configured service limit it will be clamped to that limit.
///   - radius: The number of meters about this input location within which edges (roads between intersections) will be considered as candidates for said location. When correlating this location to the route network, try to only return results within this distance (meters) from this location. If there are no candidates within this distance it will return the closest candidate within reason. If this value is larger than the configured service limit it will be clamped to that limit.
///   - rankCandidates: Whether or not to rank the edge candidates for this location. The ranking is used as a penalty within the routing algorithm so that some edges will be penalized more heavily than others. If true candidates will be ranked according to their distance from the input and various other attributes. If false the candidates will all be treated as equal which should lead to routes that are just the most optimal path with emphasis about which edges were selected.
///   - preferredSide: If the location is not offset from the road centerline or is closest to an intersection this option has no effect. Otherwise the determined side of street is used to determine whether or not the location should be visited from the same, opposite or either side of the road with respect to the side of the road the given locale drives on. In Germany (driving on the right side of the road), passing a value of same will only allow you to leave from or arrive at a location such that the location will be on your right. In Australia (driving on the left side of the road), passing a value of same will force the location to be on your left. A value of opposite will enforce arriving/departing from a location on the opposite side of the road from that which you would be driving on while a value of either will make no attempt limit the side of street that is available for the route.
///   - displayLatitude: Latitude of the map location in degrees. If provided the `latitude` and `longitude` parameters will be treated as the routing location and the `display_lat` and `display_lon` will be used to determine the side of street.
///   - displayLongitude: Longitude of the map location in degrees. If provided the `lat` and `lon` parameters will be treated as the routing location and the `display_lat` and `display_lon` will be used to determine the side of street.
///   - searchCutoff: The cutoff at which we will assume the input is too far away from civilisation to be worth correlating to the nearest graph elements.
///   - nodeSnapTolerance: During edge correlation this is the tolerance used to determine whether or not to snap to the intersection rather than along the street, if the snap location is within this distance from the intersection the intersection is used instead.
///   - streetSideTolerance: If your input coordinate is less than this tolerance away from the edge centerline then we set your side of street to none otherwise your side of street will be left or right depending on direction of travel.
///   - streetSideMaxDistance: The max distance in meters that the input coordinates or display ll can be from the edge centerline for them to be used for determining the side of street. Beyond this distance the side of street is set to none.
///   - streetSideCutoff: Disables the `preferred_side` when set to `same` or `opposite` if the edge has a road class less than that provided by `street_side_cutoff`.
///   - searchFilter: A set of optional filters to exclude candidate edges based on their attribution.
///   - dateTime: **(response only for */route*)** Expected date/time for the user to be at the location using the ISO 8601 format (YYYY-MM-DDThh:mm) in the local time zone of departure or arrival. For example "2015-12-29T08:00". If `waiting` was set on this location in the request, and it's an intermediate location, the `date_time` will describe the departure time at this location.
///   - name: Location or business name. The name may be used in the route narration directions, such as "You have arrived at <business name>.")
///   - city: City name.
///   - state: State name.
///   - postal_code: Postal code.
///   - country: Country name.
///   - phone: Telephone number.
///   - url: URL for the place or location
///   - waiting: The waiting time in seconds at this location. E.g. when the route describes a pizza delivery tour, each location has a service time, which can be respected by setting `waiting` on the location, then the departure will be delayed by this amount in seconds. Only works for `break` or `break_through types.
///   - sideOfStreet: **(response only)** The side of street of a `break` `location` that is determined based on the actual route when the `location` is offset from the street. The possible values are `left` and `right`.
public struct Location: Codable, Sendable {
    
    public let latitude: Double
    public let longitude: Double
    public let timestamp: Int
    public let traceType: TraceType
    public let heading: Int?
    public let headingTolerance: Int?
    public let street: Int?
    public let wayId: Int?
    public let minimumReachability: Int
    public let radius: Int
    public let rankCandidates: Bool
    public let preferredSide: PreferredSide
    public let displayLatitude: Double?
    public let displayLongitude: Double?
    public let searchCutoff: Int?
    public let nodeSnapTolerance: Int
    public let streetSideTolerance: Int
    public let streetSideMaxDistance: Int
    public let streetSideCutOff: RoadClass?
    public let searchFilter: SearchFilter?
    public let dateTime: Date?
    public let name: String?
    public let city: String?
    public let state: String?
    public let postalCode: String?
    public let country: String?
    public let phone: String?
    public let url: String?
    public let waiting: Int?
    public let sideOfStreet: SideOfStreet?
    
    /// Initializer
    /// - Parameters:
    ///   - latitude: The latitude
    ///   - longitude: The longitude
    ///   - timestamp: A timestamp, this will improve the result
    ///   - traceType: Type of location, either break, through, via or `breakThrough`
    ///   - heading: Preferred direction of travel for the start from the location. This can be useful for mobile routing where a vehicle is traveling in a specific direction along a road, and the route should start in that direction. The heading is indicated in degrees from north in a clockwise direction, where north is 0°, east is 90°, south is 180°, and west is 270°.
    ///   - headingTolerance: How close in degrees a given street's angle must be in order for it to be considered as in the same direction of the `heading` parameter.
    ///   - street: Street name. The street name may be used to assist finding the correct routing location at the specified latitude, longitude. This is not currently implemented.
    ///   - wayId: OpenStreetMap identification number for a polyline way. The way ID may be used to assist finding the correct routing location at the specified latitude, longitude. This is not currently implemented.
    ///   - minimumReachability: Minimum number of nodes (intersections) reachable for a given edge (road between intersections) to consider that edge as belonging to a connected region. When correlating this location to the route network, try to find candidates who are reachable from this many or more nodes (intersections). If a given candidate edge reaches less than this number of nodes its considered to be a disconnected island and we'll search for more candidates until we find at least one that isn't considered a disconnected island. If this value is larger than the configured service limit it will be clamped to that limit.
    ///   - radius: The number of meters about this input location within which edges (roads between intersections) will be considered as candidates for said location. When correlating this location to the route network, try to only return results within this distance (meters) from this location. If there are no candidates within this distance it will return the closest candidate within reason. If this value is larger than the configured service limit it will be clamped to that limit.
    ///   - rankCandidates: Whether or not to rank the edge candidates for this location. The ranking is used as a penalty within the routing algorithm so that some edges will be penalized more heavily than others. If true candidates will be ranked according to their distance from the input and various other attributes. If false the candidates will all be treated as equal which should lead to routes that are just the most optimal path with emphasis about which edges were selected.
    ///   - preferredSide: If the location is not offset from the road centerline or is closest to an intersection this option has no effect. Otherwise the determined side of street is used to determine whether or not the location should be visited from the same, opposite or either side of the road with respect to the side of the road the given locale drives on. In Germany (driving on the right side of the road), passing a value of same will only allow you to leave from or arrive at a location such that the location will be on your right. In Australia (driving on the left side of the road), passing a value of same will force the location to be on your left. A value of opposite will enforce arriving/departing from a location on the opposite side of the road from that which you would be driving on while a value of either will make no attempt limit the side of street that is available for the route.
    ///   - displayLatitude: Latitude of the map location in degrees. If provided the `latitude` and `longitude` parameters will be treated as the routing location and the `display_lat` and `display_lon` will be used to determine the side of street.
    ///   - displayLongitude: Longitude of the map location in degrees. If provided the `lat` and `lon` parameters will be treated as the routing location and the `display_lat` and `display_lon` will be used to determine the side of street.
    ///   - searchCutoff: The cutoff at which we will assume the input is too far away from civilisation to be worth correlating to the nearest graph elements.
    ///   - nodeSnapTolerance: During edge correlation this is the tolerance used to determine whether or not to snap to the intersection rather than along the street, if the snap location is within this distance from the intersection the intersection is used instead.
    ///   - streetSideTolerance: If your input coordinate is less than this tolerance away from the edge centerline then we set your side of street to none otherwise your side of street will be left or right depending on direction of travel.
    ///   - streetSideMaxDistance: The max distance in meters that the input coordinates or display ll can be from the edge centerline for them to be used for determining the side of street. Beyond this distance the side of street is set to none.
    ///   - streetSideCutoff: Disables the `preferred_side` when set to `same` or `opposite` if the edge has a road class less than that provided by `street_side_cutoff`.
    ///   - searchFilter: A set of optional filters to exclude candidate edges based on their attribution.
    ///   - name: Location or business name. The name may be used in the route narration directions, such as "You have arrived at <business name>.")
    ///   - city: City name.
    ///   - state: State name.
    ///   - postal_code: Postal code.
    ///   - country: Country name.
    ///   - phone: Telephone number.
    ///   - url: URL for the place or location
    ///   - waiting: The waiting time in seconds at this location. E.g. when the route describes a pizza delivery tour, each location has a service time, which can be respected by setting `waiting` on the location, then the departure will be delayed by this amount in seconds. Only works for `break` or `break_through types.
    public init(
        latitude: Double,
        longitude: Double,
        timestamp: Int64,
        traceType: TraceType = .´break´,
        heading: Int? = nil,
        headingTolerance: Int = 60,
        street: Int? = nil,
        wayId: Int? = nil,
        minimumReachability: Int = 50,
        radius: Int = 0,
        rankCandidates: Bool = false,
        preferredSide: PreferredSide = .either,
        displayLatitude: Double? = nil,
        displayLongitude: Double? = nil,
        searchCutoff: Int = 35,
        nodeSnapTolerance: Int = 5,
        streetSideTolerance: Int = 5,
        streetSideMaxDistance: Int = 1000,
        streetSideCutOff: RoadClass? = nil,
        searchFilter: SearchFilter? = nil,
        name: String? = nil,
        city: String? = nil,
        state: String? = nil,
        postalCode: String? = nil,
        country: String? = nil,
        phone: String? = nil,
        url: String? = nil,
        waiting: Int? = nil
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.timestamp = Int(Double(timestamp) / 1000.0)
        self.traceType = traceType
        self.heading = heading
        self.headingTolerance = headingTolerance
        self.street = street
        self.wayId = wayId
        self.minimumReachability = minimumReachability
        self.radius = radius
        self.rankCandidates = rankCandidates
        self.preferredSide = preferredSide
        self.searchCutoff = searchCutoff
        self.nodeSnapTolerance = nodeSnapTolerance
        self.streetSideTolerance = streetSideTolerance
        self.streetSideMaxDistance = streetSideMaxDistance
        self.streetSideCutOff = streetSideCutOff
        self.searchFilter = searchFilter
        self.dateTime = nil
        self.name = name
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
        self.phone = phone
        self.url = url
        self.waiting = waiting
        self.sideOfStreet = nil
        
        if let displayLatitude = displayLatitude, let displayLongitude = displayLongitude {
            self.displayLatitude = displayLatitude
            self.displayLongitude = displayLongitude
        } else {
            self.displayLatitude = nil
            self.displayLongitude = nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timestamp = "time"
        case traceType = "type"
        case heading
        case headingTolerance = "heading_tolerance"
        case street
        case wayId = "way_id"
        case minimumReachability = "minimum_reachability"
        case radius
        case rankCandidates = "rank_candidates"
        case preferredSide = "preferred_side"
        case displayLatitude = "display_lat"
        case displayLongitude = "display_lon"
        case searchCutoff = "search_cutoff"
        case nodeSnapTolerance = "node_snap_tolerance"
        case streetSideTolerance = "street_side_tolerance"
        case streetSideMaxDistance = "street_side_max_distance"
        case streetSideCutOff = "street_side_cutoff"
        case searchFilter = "search_filter"
        case dateTime = "date_time"
        case name = "name"
        case city = "city"
        case state = "state"
        case postalCode = "postal_code"
        case country = "country"
        case phone = "phone"
        case url = "url"
        case waiting = "waiting"
        case sideOfStreet = "side_of_street"
    }
    
}
