//
//  ManeuverType.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents different types of navigation maneuvers.
public enum ManeuverType: Int, Codable, CaseIterable {
    case none = 0                  // kNone
    case start = 1                 // kStart
    case startRight = 2            // kStartRight
    case startLeft = 3             // kStartLeft
    case destination = 4           // kDestination
    case destinationRight = 5      // kDestinationRight
    case destinationLeft = 6       // kDestinationLeft
    case becomes = 7               // kBecomes
    case `continue` = 8            // kContinue
    case slightRight = 9           // kSlightRight
    case right = 10                // kRight
    case sharpRight = 11           // kSharpRight
    case uturnRight = 12           // kUturnRight
    case uturnLeft = 13            // kUturnLeft
    case sharpLeft = 14            // kSharpLeft
    case left = 15                 // kLeft
    case slightLeft = 16           // kSlightLeft
    case rampStraight = 17         // kRampStraight
    case rampRight = 18            // kRampRight
    case rampLeft = 19             // kRampLeft
    case exitRight = 20            // kExitRight
    case exitLeft = 21             // kExitLeft
    case stayStraight = 22         // kStayStraight
    case stayRight = 23            // kStayRight
    case stayLeft = 24             // kStayLeft
    case merge = 25                // kMerge
    case roundaboutEnter = 26      // kRoundaboutEnter
    case roundaboutExit = 27       // kRoundaboutExit
    case ferryEnter = 28           // kFerryEnter
    case ferryExit = 29            // kFerryExit
    case transit = 30              // kTransit
    case transitTransfer = 31      // kTransitTransfer
    case transitRemainOn = 32      // kTransitRemainOn
    case transitConnectionStart = 33       // kTransitConnectionStart
    case transitConnectionTransfer = 34    // kTransitConnectionTransfer
    case transitConnectionDestination = 35 // kTransitConnectionDestination
    case postTransitConnectionDestination = 36 // kPostTransitConnectionDestination
    case mergeRight = 37           // kMergeRight
    case mergeLeft = 38            // kMergeLeft
    case elevatorEnter = 39        // kElevatorEnter
    case stepsEnter = 40           // kStepsEnter
    case escalatorEnter = 41       // kEscalatorEnter
    case buildingEnter = 42        // kBuildingEnter
    case buildingExit = 43         // kBuildingExit
}
