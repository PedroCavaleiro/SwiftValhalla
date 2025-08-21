//
//  ManeuverResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// A single maneuver within a leg describing an instruction, timing,
/// geometry indices, and other metadata used for routing and navigation.
///
/// - Parameters:
///   - type: Numeric identifier for the maneuver type.
///   - instruction: Human-readable instruction text, if present.
///   - verbalSuccinctTransitionInstruction: Optional succinct verbal transition instruction.
///   - verbalPreTransitionInstruction: Optional verbal pre-transition instruction.
///   - verbalPostTransitionInstruction: Optional verbal post-transition instruction.
///   - streetNames: Array of street names involved in the maneuver.
///   - time: Time in seconds for the maneuver.
///   - length: Length in meters for the maneuver.
///   - cost: Cost metric for the maneuver.
///   - beginShapeIndex: Start index into the route shape.
///   - endShapeIndex: End index into the route shape.
///   - verbalMultiCue: Whether verbal multi-cue is enabled.
///   - travelMode: Travel mode (drive, pedestrian, bicycle, transit).
///   - travelType: Specific travel type associated with the travel mode.
///   - beginStreetNames: Optional beginning street names.
///   - toll: Whether the maneuver involves a toll.
///   - highway: Whether the maneuver involves a highway.
///   - ferry: Whether the maneuver involves a ferry.
///   - sign: Optional sign information associated with the maneuver.
///   - roundaboutExitCount: Optional roundabout exit count.
///   - departInstruction: Optional depart instruction.
///   - verbalDepartInstruction: Optional verbal depart instruction.
///   - arriveInstruction: Optional arrive instruction.
///   - verbalArriveInstruction: Optional verbal arrive instruction.
///   - transitInfo: Optional transit-specific information.
///   - bearingBefore: Optional bearing before the maneuver.
///   - bearingAfter: Optional bearing after the maneuver.
///   - lanes: Optional lanes metadata for the maneuver.
public struct ManeuverResponse: Codable, Sendable {
    
    public let type: Int
    public let instruction: String?
    public let verbalSuccinctTransitionInstruction: String?
    public let verbalPreTransitionInstruction: String?
    public let verbalPostTransitionInstruction: String?
    public let streetNames: [String]
    public let time: Double
    public let length: Double
    public let cost: Double
    public let beginShapeIndex: Int
    public let endShapeIndex: Int
    public let verbalMultiCue: Bool
    public let travelMode: TravelMode
    public let travelType: TravelType
    public let beginStreetNames: String?
    public let toll: Bool
    public let highway: Bool
    public let ferry: Bool
    public let sign: SignResponse?
    public let roundaboutExitCount: Int?
    public let departInstruction: String?
    public let verbalDepartInstruction: String?
    public let arriveInstruction: String?
    public let verbalArriveInstruction: String?
    public let transitInfo: TransitInfo?
    public let bearingBefore: Int?
    public let bearingAfter: Int?
    public let lanes: [Lane]?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Int.self, forKey: .type)
        self.instruction = try container.decodeIfPresent(String.self, forKey: .instruction)
        self.verbalSuccinctTransitionInstruction = try? container.decodeIfPresent(String.self, forKey: .verbalSuccinctTransitionInstruction)
        self.verbalPreTransitionInstruction = try? container.decodeIfPresent(String.self, forKey: .verbalPreTransitionInstruction)
        self.verbalPostTransitionInstruction = try? container.decodeIfPresent(String.self, forKey: .verbalPostTransitionInstruction)
        self.streetNames = try container.decode([String].self, forKey: .streetNames)
        self.bearingBefore = try container.decodeIfPresent(Int.self, forKey: .bearingBefore)
        self.bearingAfter = try container.decodeIfPresent(Int.self, forKey: .bearingAfter)
        self.time = try container.decode(Double.self, forKey: .time)
        self.length = try container.decode(Double.self, forKey: .length)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.beginShapeIndex = try container.decode(Int.self, forKey: .beginShapeIndex)
        self.endShapeIndex = try container.decode(Int.self, forKey: .endShapeIndex)
        self.verbalMultiCue = (try? container.decodeIfPresent(Bool.self, forKey: .verbalMultiCue)) ?? false
        self.travelMode = try container.decode(TravelMode.self, forKey: .travelMode)
        self.beginStreetNames = try container.decodeIfPresent(String.self, forKey: .beginStreetNames)
        self.toll = (try? container.decodeIfPresent(Bool.self, forKey: .toll)) ?? false
        self.highway = (try? container.decodeIfPresent(Bool.self, forKey: .highway)) ?? false
        self.ferry = (try? container.decodeIfPresent(Bool.self, forKey: .ferry)) ?? false
        self.sign = try container.decodeIfPresent(SignResponse.self, forKey: .sign)
        self.roundaboutExitCount = try container.decodeIfPresent(Int.self, forKey: .roundaboutExitCount)
        self.departInstruction = try container.decodeIfPresent(String.self, forKey: .departInstruction)
        self.verbalDepartInstruction = try container.decodeIfPresent(String.self, forKey: .verbalDepartInstruction)
        self.arriveInstruction = try container.decodeIfPresent(String.self, forKey: .arriveInstruction)
        self.verbalArriveInstruction = try container.decodeIfPresent(String.self, forKey: .verbalArriveInstruction)
        self.transitInfo = try container.decodeIfPresent(TransitInfo.self, forKey: .transitInfo)
        self.lanes = (try? container.decodeIfPresent([Lane].self, forKey: .lanes)) ?? []
        
        switch travelMode {
        case .drive:
            let vehicle = try container.decode(VehicleType.self, forKey: .travelType)
            travelType = .drive(vehicle)
        case .pedestrian:
            let pedestrian = try container.decode(PedestrianType.self, forKey: .travelType)
            travelType = .pedestrian(pedestrian)
        case .bicycle:
            let bicycle = try container.decode(BicycleType.self, forKey: .travelType)
            travelType = .bicycle(bicycle)
        case .transit:
            let transit = try container.decode(TransitType.self, forKey: .travelType)
            travelType = .transit(transit)
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case type = "type"
        case instruction = "instruction"
        case verbalSuccinctTransitionInstruction = "verbal_succinct_transition_instruction"
        case verbalPreTransitionInstruction = "verbal_pre_transition_instruction"
        case verbalPostTransitionInstruction = "verbal_post_transition_instruction"
        case streetNames = "street_names"
        case bearingAfter = "bearing_after"
        case time = "time"
        case cost = "cost"
        case length = "length"
        case beginShapeIndex = "begin_shape_index"
        case endShapeIndex = "end_shape_index"
        case verbalMultiCue = "verbal_multi_cue"
        case travelMode = "travel_mode"
        case travelType = "travel_type"
        case beginStreetNames = "begin_street_names"
        case toll = "toll"
        case highway = "highway"
        case ferry = "ferry"
        case sign = "sign"
        case roundaboutExitCount = "roundabout_exit_count"
        case departInstruction = "depart_instruction"
        case verbalDepartInstruction = "verbal_depart_instruction"
        case arriveInstruction = "arrive_instruction"
        case verbalArriveInstruction = "verbal_arrive_instruction"
        case bearingBefore = "bearing_before"
        case transitInfo = "transit_info"
        case lanes = "lanes"
    }
    
}
