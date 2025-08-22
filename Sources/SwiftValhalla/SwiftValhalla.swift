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
    public func mapMatching(_ data: MapMatchingRequest) async -> Result<MapMatchingResponse, SwiftlyRestError> {
        let endpoint = Endpoint().withController("trace_route")
        let response: MapMatchingCall = await SwiftlyRest.shared.post(endpoint, body: data)
        return response
    }
    
}
