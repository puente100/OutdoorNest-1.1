//
//  ParksViewModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 12/1/23.
//

import SwiftUI

final class ParksViewModel: ObservableObject {
    let persistence = Persistence.shared
    
    @Published
    private(set) var parksData: ParksResponse?
    
    init() {
        Task {
            await initData()
        }
    }
    
    @MainActor func initData() async {
        do {
            if let parks = try await persistence.getParks() {
                self.parksData = parks
                print(parks)
            } else {
                print("No data")
            }
        } catch {
            print(error)
        }
    }
}
