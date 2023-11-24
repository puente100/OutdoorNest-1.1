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
    
    func getParks() async throws -> [Park]  {
        try await ACNetwork.shared.getJSON(request: .get(url: .getParks, token: APIKEY), type: ParksAPI.self).parks
        }
    }
 
