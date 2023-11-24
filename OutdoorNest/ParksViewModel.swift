//
//  ParkViewModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 12/1/23.
//

import SwiftUI

final class ParksViewModel: ObservableObject {
    let persistence = Persistence.shared
    
    @Published var parks: [Park] = []
    
    init() {
        Task {
            await initData()
        }
    }
    
    @MainActor func initData() async {
        do{
            (parks) = try await (persistence.getParks())
            
        }catch {
            print(error)
        }
        
    }
}
