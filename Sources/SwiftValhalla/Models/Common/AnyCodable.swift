//
//  AnyCodable.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 25/09/2025.
//

import Foundation

/// A type-erasing wrapper for encoding and decoding arbitrary `Any` values with `Codable`.
///
/// `AnyCodable` provides a way to work with heterogeneous data structures that need to be
/// encoded to or decoded from formats like JSON. It handles common Swift types including
/// integers, doubles, strings, booleans, arrays, and dictionaries.
///
/// ## Supported Types
///
/// The following types are supported for encoding and decoding:
/// - `Int`
/// - `Double` 
/// - `String`
/// - `Bool`
/// - `[Any]` (arrays of mixed types)
/// - `[String: Any]` (dictionaries with string keys and mixed values)
/// - `nil` values (encoded as null, decoded as `NSNull`)
///
/// ## Usage
///
/// ```swift
/// let mixedData: [String: Any] = [
///     "name": "John",
///     "age": 30,
///     "active": true,
///     "scores": [85, 92, 78]
/// ]
///
/// let anyCodable = AnyCodable(mixedData)
/// let jsonData = try JSONEncoder().encode(anyCodable)
/// let decoded = try JSONDecoder().decode(AnyCodable.self, from: jsonData)
/// ```
///
/// - Note: Unsupported types will be encoded as `null` and decoded as `NSNull()`.
/// - Important: This type uses `@unchecked Sendable` because `Any` cannot guarantee thread safety.
///   Ensure thread safety when using this type across concurrent contexts.
struct AnyCodable: Codable, @unchecked Sendable {
    /// The underlying value wrapped by this `AnyCodable` instance.
    ///
    /// This can be any of the supported types: `Int`, `Double`, `String`, `Bool`,
    /// `[Any]`, `[String: Any]`, or `NSNull` for null values.
    let value: Any
    
    /// Creates a new `AnyCodable` instance wrapping the provided value.
    ///
    /// - Parameter value: The value to wrap. Can be any type, though only certain
    ///   types are supported for encoding/decoding.
    init(_ value: Any) {
        self.value = value
    }
    
    /// Encodes the wrapped value to the given encoder.
    ///
    /// This method attempts to encode the wrapped value by checking its type against
    /// the list of supported types. If the type is not supported, it encodes `nil`.
    ///
    /// - Parameter encoder: The encoder to write data to.
    /// - Throws: `EncodingError` if the value cannot be encoded.
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let intValue = value as? Int {
            try container.encode(intValue)
        } else if let doubleValue = value as? Double {
            try container.encode(doubleValue)
        } else if let stringValue = value as? String {
            try container.encode(stringValue)
        } else if let boolValue = value as? Bool {
            try container.encode(boolValue)
        } else if let arrayValue = value as? [Any] {
            try container.encode(arrayValue.map(AnyCodable.init))
        } else if let dictValue = value as? [String: Any] {
            try container.encode(dictValue.mapValues(AnyCodable.init))
        } else {
            try container.encodeNil()
        }
    }
    
    /// Creates a new `AnyCodable` instance by decoding from the given decoder.
    ///
    /// This initializer attempts to decode a value by trying each supported type
    /// in sequence. If no type matches, it defaults to `NSNull()`.
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: `DecodingError` if the value cannot be decoded to any supported type.
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let intValue = try? container.decode(Int.self) {
            value = intValue
        } else if let doubleValue = try? container.decode(Double.self) {
            value = doubleValue
        } else if let stringValue = try? container.decode(String.self) {
            value = stringValue
        } else if let boolValue = try? container.decode(Bool.self) {
            value = boolValue
        } else if let arrayValue = try? container.decode([AnyCodable].self) {
            value = arrayValue.map(\.value)
        } else if let dictValue = try? container.decode([String: AnyCodable].self) {
            value = dictValue.mapValues(\.value)
        } else {
            value = NSNull()
        }
    }
}
