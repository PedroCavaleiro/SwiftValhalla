//
//  SignResponse.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Sign information attached to a maneuver, grouping different
/// types of sign elements (exit number, branch, toward, name).
///
/// - Parameters:
///   - exitNumberElements: Elements representing exit numbers.
///   - exitBranchElements: Elements representing exit branches.
///   - exitTowardElements: Elements representing exit toward indicators.
///   - exitNameElements: Elements representing exit names.
public struct SignResponse: Codable {
    public let exitNumberElements: [ManeuverSignElement]?
    public let exitBranchElements: [ManeuverSignElement]?
    public let exitTowardElements: [ManeuverSignElement]?
    public let exitNameElements: [ManeuverSignElement]?
    
    enum CodingKeys: String, CodingKey {
        case exitNumberElements = "exit_number_elements"
        case exitBranchElements = "exit_branch_elements"
        case exitTowardElements = "exit_toward_elements"
        case exitNameElements = "exit_name_elements"
    }
}

/// An individual element of a maneuver sign (text and consecutive count).
///
/// - Parameters:
///   - text: The sign text.
///   - consecutiveCount: Number of consecutive occurrences for the element.
public struct ManeuverSignElement: Codable {
    public let text: String
    public let consecutiveCount: Int
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case consecutiveCount = "consecutive_count"
    }
}
