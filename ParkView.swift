//
//  ParkView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/4/24.
//

import SwiftUI
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
                            .frame(height :150) // Adjust the height as needed
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
        .background(Color.green.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        let park = Park(id: "1234567",
                        url: nil,
                        fullName: "Parque de prueba",
                        parkCode: nil,
                        description: nil,
                        latitude: nil,
                        longitude: nil,
                        latLong: nil,
                        activities: nil,
                        topics: nil,
                        states: nil,
                        contacts: nil,
                        entranceFees: nil,
                        entrancePasses: nil,
                        fees: nil,
                        directionsInfo: nil,
                        directionsURL: nil,
                        operatingHours: nil,
                        addresses: nil,
                        images: nil,
                        weatherInfo: nil,
                        name: "Parque de prueba",
                        designation: nil,
                        relevanceScore: nil)
        ParkView(park: park)
    }
}

