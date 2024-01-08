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
        NavigationStack {
            
            if let parks = parksVM.parksData?.data {
                List {
                    Section (header:
                                HStack {
                        Text("National parks")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                    })
                    {
                    ForEach(parks, id: \.id) { park in
                        NavigationLink {
                            Text(park.fullName)
                        } label: {
                            ParkView(park: park)
                        }
                        }
                    }
                }
            }
        }
    }
}


// Your preview code seems to have a typo, it should be `Preview` instead of `#Preview`
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




