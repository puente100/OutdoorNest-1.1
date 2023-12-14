//
//  ContentView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/23/23.
//

import SwiftUI
import ACNetwork

struct ContentView: View {
    @ObservedObject var parksVM = ParksViewModel()
    
    var body: some View {
        
        VStack{
            if let parksData = parksVM.parksData  {
                List(parksVM.parksData?.data ?? []) { park in
                    Text(park.fullName)
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
