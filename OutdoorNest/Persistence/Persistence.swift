//
//  Persistence.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 12/2/23.
//

import SwiftUI
import ACNetwork

final class Persistence {
    
    static let shared = Persistence()
    private let generator = NetworkEndpointGenerator()
    
    func getParks() async throws -> ParksResponse?  {
        guard let parksUrl = generator.getURL(for: .parks) else { return nil }
        return try await ACNetwork.shared.getJSON(request: .get(url: parksUrl, token: "", authMethod: .basic), type: ParksResponse.self)
    }
}

