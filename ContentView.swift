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
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }) {
                        ForEach(parks, id: \.id) { park in
                            NavigationLink {
                                ParkDetailsView(parkDetailsData: ParkDetailsView.generateListData(with: park))
                            } label: {
                                ParkView(park: park)
                            }
                        }
                    }
                }.listStyle(.plain)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




