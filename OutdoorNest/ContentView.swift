//
//  ContentView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/23/23.
//

import SwiftUI
import ACNetwork

struct ParkView: View {
    let park: Park
    
    var body: some View {
        VStack {
            if let imageUrlString = park.images?.first?.url,
               let imageUrl = URL(string: imageUrlString) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height :100) // Adjust the height as needed
                            .clipped()
                    case .failure(_):
                        ProgressView()
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                ProgressView() // Show a progress view or placeholder if URL is missing or invalid
            }
            
            Text(park.name ?? "")
                .font(.title)
   
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ContentView: View {
    @ObservedObject var parksVM = ParksViewModel()
    
    var body: some View {
        ScrollView {
            if let parks = parksVM.parksData?.data {
                LazyVGrid(columns: [.init(.adaptive(minimum: 150))]) {
                    ForEach(parks, id: \.id) { park in
                        ParkView(park: park)
                    }
                }
            } else {
                Text("No parks data available") // Placeholder text if data is not present
            }
        }
    }
}

// Assuming you have a ParksViewModel implementation fetching data

// Your preview code seems to have a typo, it should be `Preview` instead of `#Preview`
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




