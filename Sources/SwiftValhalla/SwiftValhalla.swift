//
//  SwiftValhalla.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation
import SwiftlyRest

@MainActor
public class SwiftValhalla {
    
    public static let shared = SwiftValhalla()
    
    private var restClient: SwiftlyRest? = nil
    
    
    /// Configure the shared `SwiftValhalla` instance with a server URL string.
    ///
    /// This parses the provided `serverURL` string into a `URL` and stores it on
    /// `SwiftValhalla.shared.serverURL` for use throughout the library.
    ///
    /// - Parameter serverURL: The server URL string to use (e.g. "https://api.example.com").
    /// - Throws: An `NSError` with domain `"SwiftValhalla"` and code `1001` when the
    ///           provided string cannot be converted to a valid `URL`.
    /// - Note: Call once early in your app's lifecycle (for example in `AppDelegate`
    ///         or during startup) before performing network operations.
    public func configure(serverURL: String) throws {
        if let url = URL(string: serverURL) {
            self.restClient = SwiftlyRest(baseURL: url)
        } else {
            throw NSError(domain: "SwiftValhalla", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Invalid server URL"])
        }
    }
    
    /// Performs a map matching request using the provided data.
    ///
    /// - Parameter data: The map matching request data.
    /// - Returns: A `Result` containing either a `MapMatchingResponse` on success or a `SwiftlyRestError` on failure.
    /// 
    /// - Note: Check the SwiftlyRest docs on how to unpack a SwiftlyRestError https://pedrocavaleiro.github.io/SwiftlyRest/Enums/SwiftlyRestError.html
    ///
    /// Usage Example:
    /// ```swift
    /// let request = MapMatchingRequest(/* your request data */)
    /// let result = await SwiftValhalla.shared.mapMatching(request)
    /// switch result {
    /// case .success(let response):
    ///     // Handle successful response
    /// case .failure(let error):
    ///     // Handle SwiftlyRestError
    /// }
    /// ```
    public func mapMatching(_ data: MapMatchingRequest) async throws -> Result<MapMatchingResponse, SwiftlyRestError> {
        guard let restClient = self.restClient else {
            throw NSError(domain: "SwiftValhalla", code: 1002, userInfo: [NSLocalizedDescriptionKey : "Rest client not configured"])
        }
        
        let endpoint = Endpoint().withController("trace_route")
        let response: MapMatchingCall = await restClient.post(endpoint, body: data)
        return response
    }
    
    /// Performs a matrix request to calculate travel times and distances between multiple locations.
    ///
    /// This method computes one-to-many, many-to-one, or many-to-many matrices that provide
    /// travel times and distances between source and target locations. The request data is
    /// encoded as JSON and sent as a query parameter to the Valhalla matrix service.
    ///
    /// - Parameter data: The matrix request containing source locations, target locations, and routing preferences.
    /// - Returns: A `Result` containing either a `MatrixResponse` on success or a `SwiftlyRestError` on failure.
    /// 
    /// - Throws: 
    ///   - `NSError` with domain `"SwiftValhalla"` and code `1002` when the REST client is not configured.
    ///   - `NSError` with domain `"SwiftValhalla"` and code `1003` when the matrix request cannot be encoded to JSON.
    ///   - `NSError` with domain `"SwiftValhalla"` and code `1004` when the JSON data cannot be converted to a string.
    ///
    /// - Note: Check the SwiftlyRest documentation on how to handle `SwiftlyRestError`: https://pedrocavaleiro.github.io/SwiftlyRest/Enums/SwiftlyRestError.html
    ///
    /// ## Usage Example
    ///
    /// ```swift
    /// let sources = [
    ///     Location(latitude: 40.7128, longitude: -74.0060), // New York
    ///     Location(latitude: 34.0522, longitude: -118.2437)  // Los Angeles
    /// ]
    /// 
    /// let targets = [
    ///     Location(latitude: 41.8781, longitude: -87.6298), // Chicago
    ///     Location(latitude: 29.7604, longitude: -95.3698)  // Houston
    /// ]
    /// 
    /// let request = MatrixRequest(
    ///     sources: sources,
    ///     targets: targets,
    ///     costing: .auto,
    ///     units: .kilometers
    /// )
    /// 
    /// do {
    ///     let result = try await SwiftValhalla.shared.matrix(request)
    ///     switch result {
    ///     case .success(let response):
    ///         // Access travel times and distances
    ///         let travelTime = response.sourcesToTargets[0][1]?.time
    ///         let distance = response.sourcesToTargets[0][1]?.distance
    ///     case .failure(let error):
    ///         // Handle SwiftlyRestError
    ///         print("Matrix request failed: \(error)")
    ///     }
    /// } catch {
    ///     // Handle configuration or encoding errors
    ///     print("Request setup failed: \(error)")
    /// }
    /// ```
    ///
    /// - Important: Ensure that ``configure(serverURL:)`` has been called before using this method.
    public func matrix(_ data: MatrixRequest) async throws -> Result<MatrixResponse, SwiftlyRestError> {
        guard let restClient = self.restClient else {
            throw NSError(domain: "SwiftValhalla", code: 1002, userInfo: [NSLocalizedDescriptionKey : "Rest client not configured"])
        }
        
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(data) else {
            throw NSError(domain: "SwiftValhalla", code: 1003, userInfo: [NSLocalizedDescriptionKey : "Failed to encode matrix request"])
        }
        
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            throw NSError(domain: "SwiftValhalla", code: 1004, userInfo: [NSLocalizedDescriptionKey : "Failed to convert matrix request to string"])
        }
        
        let endpoint = Endpoint()
            .withController("sources_to_targets")
            .withQuery([
                "json": jsonString
            ])
        
        let response: MatrixCall = await restClient.get(endpoint)
        return response
        
    }
    
}
