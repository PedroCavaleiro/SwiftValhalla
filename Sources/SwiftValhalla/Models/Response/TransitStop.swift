//
//  TransitStop.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Information about a transit stop including type, times, and location.
///
/// - Parameters:
///   - type: The transit stop type.
///   - name: The stop name.
///   - arrivalDateTime: Scheduled or actual arrival time as a string.
///   - departureDateTime: Scheduled or actual departure time as a string.
///   - assumedSchedule: Whether the times are assumed from schedule.
///   - latitude: Latitude of the stop.
///   - longitude: Longitude of the stop.
public struct TransitStop: Codable {
    
    public let type: TransitStopType
    public let name: String
    public let arrivalDateTime: String
    public let departureDateTime: String
    public let assumedSchedule: Bool
    public let latitude: Double
    public let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
        case arrivalDateTime = "arrival_time"
        case departureDateTime = "departure_time"
        case assumedSchedule = "assumed_schedule"
        case latitude = "lat"
        case longitude = "lon"
    }
    
}
