//
//  DirectionsOptions.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Directions options structure
/// - Parameters:
///   - units: Distance units for output. Allowable unit types are miles (or mi) and kilometers (or km).
///   - language: The language of the narration instructions based on the IETF BCP 47 language tag string.
///   - directionsType: What should be returned for directions
///   - format: Format of the response
///   - shapeFormat: If `"format" : "osrm"` is set: Specifies the optional format for the path shape of each connection.
///   - bannerInstructions: If the `format` is `osrm`, this boolean indicates if each step should have the additional `bannerInstructions` attribute, which can be displayed in some navigation system SDKs.
///   - voiceInstructions: If the `format` is `osrm`, this boolean indicates if each step should have the additional `voiceInstructions` attribute, which can be heard in some navigation system SDKs.
///   - alternates: A number denoting how many alternate routes should be provided. There may be no alternates or less alternates than the user specifies. Alternates are not yet supported on multipoint routes (that is, routes with more than 2 locations). They are also not supported on time dependent routes.
public struct DirectionsOptions: Codable {
    
    public let units: Unit
    public let language: Language
    public let directionsType: DirectionType
    public let format: Format
    public let shapeFormat: ShapeFormat?
    public let bannerInstructions: Bool
    public let voiceInstructions: Bool
    public let alternates: Int?
    
    /// Initializer
    /// - Parameters:
    ///   - units: Distance units for output. Allowable unit types are miles (or mi) and kilometers (or km).
    ///   - language: The language of the narration instructions based on the IETF BCP 47 language tag string.
    ///   - directionsType: What should be returned for directions
    ///   - format: Format of the response
    ///   - shapeFormat: If `"format" : "osrm"` is set: Specifies the optional format for the path shape of each connection.
    ///   - bannerInstructions: If the `format` is `osrm`, this boolean indicates if each step should have the additional `bannerInstructions` attribute, which can be displayed in some navigation system SDKs.
    ///   - voiceInstructions: If the `format` is `osrm`, this boolean indicates if each step should have the additional `voiceInstructions` attribute, which can be heard in some navigation system SDKs.
    ///   - alternates: A number denoting how many alternate routes should be provided. There may be no alternates or less alternates than the user specifies. Alternates are not yet supported on multipoint routes (that is, routes with more than 2 locations). They are also not supported on time dependent routes.
    public init(
        units: Unit = .kilometers,
        language: Language = .englishUnitedStates,
        directionsType: DirectionType = .none,
        format: Format = .json,
        shapeFormat: ShapeFormat? = nil,
        bannerInstructions: Bool = true,
        voiceInstructions: Bool = true,
        alternates: Int? = nil
    ) {
        self.units = units
        self.language = language
        self.directionsType = directionsType
        self.format = format
        self.bannerInstructions = format == .osrm ? bannerInstructions : false
        self.voiceInstructions = format == .osrm ? voiceInstructions : false
        self.alternates = alternates
        
        if format == .osrm {
            if let shapeFormat = shapeFormat {
                self.shapeFormat = shapeFormat
            } else {
                self.shapeFormat = .polyline6
            }
        } else {
            self.shapeFormat = nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case units = "units"
        case language = "language"
        case directionsType = "directions_type"
        case format = "format"
        case shapeFormat = "shape_format"
        case bannerInstructions = "banner_instructions"
        case voiceInstructions = "voice_instructions"
        case alternates = "alternates"
    }
    
}
