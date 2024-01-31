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
    @State var launch = false
    
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
        .frame (maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
                .overlay {
                    LoginView(back: $launch)
                }
                .opacity(launch ? 1.0 : 0.0)
                .animation(.easeOut.delay(launch ? 0 : 1), value: launch)
            
        }
        .onAppear {
            launch = true
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




