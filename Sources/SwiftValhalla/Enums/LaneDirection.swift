//
//  LaneDirection.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 21/08/2025.
//

import Foundation

/// Represents possible lane directions as a bitmask.
///
/// This type is an `OptionSet`, which means multiple directions can be combined:
///
/// ```swift
/// // Example: A lane that allows both going straight and turning left
/// let lane: LaneDirection = [.through, .left]
///
/// // Checking if a lane includes a left turn
/// if lane.contains(.left) {
///     print("This lane allows a left turn")
/// }
///
/// // Checking for multiple directions
/// if lane.contains([.through, .left]) {
///     print("This lane allows straight and left")
/// }
/// ```
///
/// Use `.all` to access every possible lane direction, e.g. for validation or iteration.
public struct LaneDirection: OptionSet, Codable, Sendable {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Empty - No turn lane or undefined
    public static let empty = LaneDirection([])

    /// None - No specific direction
    public static let none = LaneDirection(rawValue: 1)

    /// Through - Goes straight
    public static let through = LaneDirection(rawValue: 2)

    /// SharpLeft - Turns sharply to the left
    public static let sharpLeft = LaneDirection(rawValue: 4)

    /// Left - Turns left
    public static let left = LaneDirection(rawValue: 8)

    /// SlightLeft - Turns slightly to the left
    public static let slightLeft = LaneDirection(rawValue: 16)

    /// SlightRight - Turns slightly to the right
    public static let slightRight = LaneDirection(rawValue: 32)

    /// Right - Turns right
    public static let right = LaneDirection(rawValue: 64)

    /// SharpRight - Turns sharply to the right
    public static let sharpRight = LaneDirection(rawValue: 128)

    /// Reverse - U-turn
    public static let reverse = LaneDirection(rawValue: 256)

    /// MergeToLeft - Lane merges to the left
    public static let mergeToLeft = LaneDirection(rawValue: 512)

    /// MergeToRight - Lane merges to the right
    public static let mergeToRight = LaneDirection(rawValue: 1024)

    /// All possible lane directions
    public static let all: [LaneDirection] = [
        .empty, .none, .through, .sharpLeft, .left, .slightLeft,
        .slightRight, .right, .sharpRight, .reverse,
        .mergeToLeft, .mergeToRight
    ]
}

